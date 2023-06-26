user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")

readmes_all = [
  {
    name:'Rashaan',
    age:31,
    gender:'male',
    gender_preference:'female',
    location:'NYC',
    programming_language:'Python',
    image:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.snackandbakery.com%2Farticles%2F105434-pandemic-pumped-up-2020-chocolate-sales-packaged-facts&psig=AOvVaw3qDcpMyBsAy8-wRL114AmC&ust=1687556316445000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCICi6azr1_8CFQAAAAAdAAAAABAE'
  },
  {
    name:'Ernesto',
    age:31,
    gender:'male',
    gender_preference:'female',
    location:'San Diego',
    programming_language:'Ruby',
    image: 'https://images.unsplash.com/photo-1602002418209-55d7a55adf42?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGJ1bmdhbG93fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'
  },
  {
    name:'Bea',
    age:26,
    gender:'female',
    gender_preference:'female',
    location:'Washington D.C',
    programming_language:'JavaScript',
    image: 'https://images.unsplash.com/photo-1540468348633-084ed9d348f1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGJ1bmdhbG93fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'
  }
]

readmes_all.each do |readme|
  user1.readmes.create(readme)
  p "creating: #{readme}"
end

