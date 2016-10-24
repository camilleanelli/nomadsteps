class FriendshipsController < AuthenticatedController
  def index
    @friends = current_user.friends
    @inverse_friends = current_user.inverse_friends
  end


  def new
    @friend = current_user.friends.new
  end

  def create
    @friend = User.find_or_create_by(params_friend)
      @friend.invite!
      current_user.friends << @friend
      flash[:notice] = "Your friend has been successfully added to your account"
      redirect_to trips_path
  end

  def destroy
    @friendships = current_user.friendships.where(friend_id: params[:id])
    @inverse_friendships = current_user.inverse_friendships.where(user_id: params[:id])
    @trips = current_user.trips
    @friendships.each do |friendship|
      friendship.destroy
      @trips.each do |trip|
         trip.users.each do |user|
           if user.id == friendship.friend.id
             trip.users.delete(user)
           end
         end
      end
    end
    @inverse_friendships.each do |inverse_friendship|
      inverse_friendship.destroy
      @trips.each do |trip|
         trip.users.each do |user|
           if user.id == inverse_friendship.user.id
             trip.users.delete(user)
           end
         end
      end
    end
    flash[:notice] = "Your friend has been removed from your account"
    redirect_to friendships_path(current_user)
  end

  private

  def params_friend
    params[:user].permit(:email)
  end

end
