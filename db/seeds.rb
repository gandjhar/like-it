Post.destroy_all
User.destroy_all

frank = User.create( email: 'frank@ex.com', password: 'f', password_confirmation: 'f' )
alice = User.create( email: 'alice@ex.com', password: 'a', password_confirmation: 'a' )

Post.create( body: "Pizza is yummy!"  , user: frank )
Post.create( body: "I like Star Wars.", user: frank )

Post.create( body: "Veggies are tasty and nutritious." , user: alice )
Post.create( body: "Walking Dead has an exciting plot.", user: alice )
Post.create( body: "My cats are cute!"                 , user: alice )
