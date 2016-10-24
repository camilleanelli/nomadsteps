class FriendshipsController < AuthenticatedController
  def index

    @friends = current_user.friends
    @inverse_friends = current_user.inverse_friends
  end


  def new
    @friend = current_user.friends.new
  end

  def create
    @friend = User.find_by(params_friend)
    if @friend.nil?
      @friend.invite!(params_friend)
    else
      @friend.invite!
    end
    current_user.friends << @friend
    flash[:notice] = "Your friend has been successfully added to your account"
    redirect_to trips_path
  end

  def destroy
    @friendships = current_user.friendships.where(friend_id: params[:id])
    @trips = current_user.trips
    @friendships.each do |friendship|
      friendship.destroy
      @trips.each do |trip|
         trip.users.each do |user|
           if user.id == friendship.friend.id
             trip.users.delete(user.id)
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
