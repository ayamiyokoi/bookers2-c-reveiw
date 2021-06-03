class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @groups = Group.all
    @book = Book.new
  end

  def new
    @group = Group.new
    @group.users << current_user

  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  def edit
    if @group.owner_id.to_i == current_user.id.to_i
      render "edit"
    else
      redirect_to groups_path
    end
  end


  private
  def group_params
    params.require(:group).permit(:name, :introduction, :group_image, :owner_id, user_ids: [] )
  end

  def set_group
    @group = Group.find(params[:id])
  end


end
