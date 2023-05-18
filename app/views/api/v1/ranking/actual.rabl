collection @ranking
child(:ranking) do
  attributes :amount 
  child(:user) {attributes :name}
end
