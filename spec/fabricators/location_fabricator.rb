Fabricator(:location) do
  name { sequence(:name) { |i| "Name #{i}" } }
  description "Description is 9/10ths of the law"
end
