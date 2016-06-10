
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.all.each(&:destroy)
# Comment.delete_all
user = User.create([
  {username: 'user1', email: 'abcd@yahoo.com', password: '123'},
  {username: 'user2', email: 'abcd1@yahoo.com', password: '123'},
  {username: 'user3', email: 'abcd2@yahoo.com', password: '123'}
  ])
post = Post.create({
      user_id: user[0].id,
      title: 'Nature', content: 'Landscape and mountain climbing',
      image:  'http://www.greatlandofalaska.com/pictures/mountains/Chugach/KingMountain.jpg',
      category: 'nature'
  })
  Comment.create([
   {user_id: user[0].id, post_id: post.id, content: 'this is a comment content 1111', like: 'true'},
   {user_id: user[0].id, post_id: post.id, content: 'this is a comment content 2222', like: 'false'},
   {user_id: user[0].id, post_id: post.id, content: 'this is a comment content 3333', like: 'true'}
  ])
