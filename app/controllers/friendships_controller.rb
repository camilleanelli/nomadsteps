class FriendshipsController < AuthenticatedController
  def index

    @friends = current_user.friends
    @inverse_friends = current_user.inverse_friends.all
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
    redirect_to trips_path
  end

  def destroy
    @friendships = current_user.friendships.where(friend_id: params[:id])
    @friendships.each do |friendship|
      friendship.destroy
    end
    redirect_to friendships_path(current_user)
  end

  private

  def params_friend
    params[:user].permit(:email)
  end

end
