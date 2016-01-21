Given(/^an authenticate user$/) do
  @user = create(:user)
  sign_in(@user)
end
