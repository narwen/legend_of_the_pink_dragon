Fabricator(:user) do
  username { sequence(:username) { |i| "brandon#{i}" } }
  email { sequence(:email) { |i| "brandon#{i}@awesome.com" } }
  password "secret"
  password_confirmation "secret"
  admin false
end

Fabricator(:admin, :from => :user) do
  admin true
end
