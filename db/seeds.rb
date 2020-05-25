puts "starting seed"
Unicorn.destroy_all
User.destroy_all

charles = User.create(email: "charles.stas@nextdecision.fr", password: "123456", admin: true)
nicolas = User.create(email: "nicolas.leroy@nextdecision.fr", password: "123456", admin: false)

puts "seed completed"
