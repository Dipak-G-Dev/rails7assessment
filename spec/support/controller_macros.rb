Module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.new(first_name:"Test1", email:'Test1123@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345' )
      sign_in user
    end
  end
end
