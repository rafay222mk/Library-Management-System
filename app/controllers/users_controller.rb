# frozen_string_literal: true

class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @q = User.ransack(params[:q])
    @pagy, @users = pagy_countless(@q.result(distinct: true).std_list.order(created_at: :asc), items: 6) if  params[:q].present?
    @pagy, @users = pagy_countless(@q.result(distinct: true).lib_list.order(created_at: :asc), items: 6) if  params[:q].present?

    @users = User.std_list if params[:show] == 'student_list'
    @users = User.lib_list if params[:show] == 'librarian_list'
  end

  def student
    @std = User.std_list
    respond_to do |format|
      format.html
      format.pdf do
        # render pdf: "Users: #{@users.count}", template: "users/index.html.erb" # Excluding ".pdf" extension.
        render pdf: "Students.pdf", template: "users/student", formats: [:html]
      end
      end
  end

  def student_csv
    @std = User.std_list
    respond_to do |format|
      format.html
      format.csv { send_data @std.to_csv }
    end
  end

  def show
    @student = User.find(params[:id])
  end

  def showbh
    @student = User.find(params[:id])
  end
  def fetch_country_states
    debugger
  end
end
