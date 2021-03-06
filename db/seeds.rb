require 'csv'

class Seed

  def initialize
    Bid.destroy_all
    Category.destroy_all
    Industry.destroy_all
    Pro.destroy_all
    User.destroy_all
    Service.destroy_all
    ProService.destroy_all
    Project.destroy_all
    Review.destroy_all
    generate_industries
    generate_categories
    generate_services
    generate_bids_with_conversations
    generate_project_with_review
    generate_project_with_no_review
    generate_multiple_bids_for_project
  end

  def generate_bids_with_conversations
    pro = Pro.create!(first_name: "Jimi", 
                      last_name: "Hendrix", 
                      zipcode: "80203", 
                      phone_number: "5555055050", 
                      email: "jimi@example.com", 
                      password: "password", 
                      country_code: "+1")

    pro_service = pro.pro_services.create(service_id: 1, radius: 30)
    pro_service2 = pro.pro_services.create(service_id: 240, radius: 30)
    pro.pro_services.create(service_id: 2, radius: 30)
    pro.pro_services.create(service_id: 55, radius: 30)
    pro.pro_services.create(service_id: 90, radius: 30)
    pro.pro_services.create(service_id: 199, radius: 30)

    requester = User.create(first_name: "Burt",  
                            last_name: "Reynolds", 
                            zipcode: "80203", 
                            phone_number: "5555055051", 
                            email: "burt@example.com", 
                            password: "password", 
                            country_code: "+1")

    requester2 = User.create(first_name: "Tom",
                            last_name: "Brady", 
                            zipcode: "80203", 
                            phone_number: "5555055051", 
                            email: "tomt@example.com", 
                            password: "password", 
                            country_code: "+1")

    requester3 = User.create(first_name: "Arnold", 
                            last_name: "Palmer", 
                            zipcode: "80203", 
                            phone_number: "5555055051", 
                            email: "arnie@example.com", 
                            password: "password", 
                            country_code: "+1")

    project1 = Project.create!(service_id: 55, 
                            zipcode: "80203", 
                            description: "I needz da french.", 
                            status: "open", 
                            requester_id: 1, 
                            recurring: true, 
                            timeline: "ASAP")

    project2 = Project.create!(service_id: 55, 
                              zipcode: "80203", 
                              description: "Moar french plz.", 
                              status: "closed", 
                              requester_id: 2, 
                              recurring: true, 
                              timeline: "ASAP")
    
    project3 = Project.create!(service_id: 240, 
                              zipcode: "80203", 
                              description: "I'm going to need more french. I'm still pretty bad.", 
                              status: "accepted", 
                              requester_id: 2, 
                              timeline: "ASAP")

    project4 = Project.create(service_id: 1,
                              zipcode: "80203",   
                              description: "Help me. I really just need...please help.", 
                              status: "open", 
                              recurring: true, 
                              requester_id: 2,
                              timeline: "ASAP")
                              
    project5 = Project.create!(service_id: 90,
                              zipcode: "80203", 
                              description: "CAN YOU MAKE ME FLUENT?! This is the job for you!.", 
                              status: "closed", 
                              recurring: true, 
                              requester_id: 3,  
                              timeline: "ASAP")
    
    project6 = Project.create!(service_id: 2,
                              zipcode: "80203", 
                              description: "French onion soup, ASAP!", 
                              status: "open", 
                              recurring: true, 
                              requester_id: 3,
                              timeline: "ASAP")
    
    project7 = Project.create!(service_id: 240,
                              zipcode: "80203", 
                              description: "I speak-a the French.", 
                              status: "accepted", 
                              recurring: false, 
                              requester_id: 3,
                              timeline: "ASAP") 

    project8 = Project.create!(service_id: 240,
                              zipcode: "80203", 
                              description: "Hi! I am traveling to France tomorrow! Can you teach me how to speak French tonight???", 
                              status: "closed", 
                              recurring: false, 
                              requester_id: 4, 
                              timeline: "ASAP")


    Review.create(comment: "Hey! Thanks for teaching pretty good french!", 
                  rating: 4.0, 
                  user_id: pro.id, 
                  project_id: project2.id)

    Review.create(comment: "These French lessons were adequate.", 
                  rating: 3.0, 
                  user_id: pro.id, 
                  project_id: project5.id)

    Review.create(comment: "Your french accent sounds like you're from Atlantic City. Boo.", 
                  rating: 2.0, 
                  user_id: pro.id, 
                  project_id: project8.id)

    
    project1.bids.create!(
      user_id: 1,
      amount: "700",
      comment: "Hi, my name is Jimi. I've done several similar jobs in your area and have received some pretty excellent reviews. I'd love to talk more details about your project. Please call me at 303-123-4345. Thanks!", 
      status: "open"
    )

    project2.bids.create!(
      user_id: 1,
      amount: "700",
      comment: "Hi, my name is Jimi. I've done several similar jobs in your area and have received some pretty excellent reviews. I'd love to talk more details about your project. Please call me at 303-123-4345. Thanks!", 
      status: "accepted"
    )

    project3.bids.create!(
      user_id: 1,
      amount: "700",
      comment: "Hi, my name is Jimi. I've done several similar jobs in your area and have received some pretty excellent reviews. I'd love to talk more details about your project. Please call me at 303-123-4345. Thanks!", 
      status: "accepted"
    )

    project4.bids.create!(
      user_id: 1,
      amount: "700",
      comment: "Hi, my name is Jimi. I've done several similar jobs in your area and have received some pretty excellent reviews. I'd love to talk more details about your project. Please call me at 303-123-4345. Thanks!", 
      status: "open"
    )

    project5.bids.create!(
      user_id: 1,
      amount: "700",
      comment: "Hi, my name is Jimi. I've done several similar jobs in your area and have received some pretty excellent reviews. I'd love to talk more details about your project. Please call me at 303-123-4345. Thanks!", 
      status: "accepted"
    )

    project6.bids.create!(
      user_id: 1,
      amount: "700",
      comment: "Hi, my name is Jimi. I've done several similar jobs in your area and have received some pretty excellent reviews. I'd love to talk more details about your project. Please call me at 303-123-4345. Thanks!", 
      status: "open"
    )

    project7.bids.create!(
      user_id: 1,
      amount: "700",
      comment: "Hi, my name is Jimi. I've done several similar jobs in your area and have received some pretty excellent reviews. I'd love to talk more details about your project. Please call me at 303-123-4345. Thanks!", 
      status: "rejected"
    )

    project8.bids.create!(
      user_id: 1,
      amount: "700",
      comment: "Hi, my name is Jimi. I've done several similar jobs in your area and have received some pretty excellent reviews. I'd love to talk more details about your project. Please call me at 303-123-4345. Thanks!", 
      status: "accepted"
    )

    # bid = Bid.create(user_id: 1, 
    # project_id: project4.id, 
    # amount: "700", 
    # comment: "Hi, my name is Jimi. I've done several similar jobs in your area and have received some pretty excellent reviews. I'd love to talk more details about your project. Please call me at 303-123-4345. Thanks!", 
    # status: "open")

    # bid2 = Bid.create(user_id: 1, 
    # project_id: project3.id,
    # amount: "100", 
    # comment: "Hi, my name is Jimi. I've done several similar jobs in your area and have received some pretty excellent reviews. I'd love to talk more details about your project. Please call me at 303-123-4345. Thanks!", 
    # status: "accepted")
    
    # bid3 = Bid.create(user_id: 1, 
    # project_id: project2.id, 
    # amount: "300", 
    # comment: "Hi, my name is Jimi. I've done several similar jobs in your area and have received some pretty excellent reviews. I'd love to talk more details about your project. Please call me at 303-123-4345. Thanks!", 
    # status: "accepted")
  end

  def generate_industries
    industries.each do |industry|
      new_industry = Industry.create!(name: industry[:name])

      puts "Created Industry: #{new_industry.name}"
    end
  end

  def generate_categories
    categories.each do |category|
      new_category = Category.create!(name: category[:name],
                                      industry: Industry.find_by(name: category[:industry_name]))

    puts "Created Category: #{new_category.name}"
    end
  end

  def generate_services
    services.each do |service|
      new_service = Service.create!(name: service[:name],
                      category: Category.find_by(name: service[:category_name]))

      puts "Created Service: #{new_service.name}"
    end
  end

  def industries
    CSV.open'db/csv/industries_services_categories/industries-Table 1.csv', headers: true, header_converters: :symbol
  end

  def categories
    CSV.open'db/csv/industries_services_categories/categories-Table 1.csv', headers: true, header_converters: :symbol
  end

  def services
    CSV.open'db/csv/industries_services_categories/services-Table 1.csv', headers: true, header_converters: :symbol
  end

  def generate_project_with_review
    pro = Pro.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      zipcode: "80211",
                      phone_number: Faker::PhoneNumber.phone_number,
                      email: Faker::Internet.email,
                      password: "password",
                      country_code: "+1")
    service = Service.find_by(name: "French Lessons")
    pro_service = pro.pro_services.create(service_id: service.id, radius: 25)
    user = User.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      zipcode: "80219",
                      phone_number: Faker::PhoneNumber.phone_number,
                      email: "review@example.com",
                      password: "password",
                      country_code: "+1")
    project = user.projects.create!(service_id: service.id, zipcode: 80223, description: "I need french lessons.", status: "closed")
    project2 = user.projects.create!(service_id: service.id, zipcode: 80223, description: "I'm going to need more french. I'm still pretty bad.", status: "open")
    project3 = user.projects.create!(service_id: service.id, zipcode: 80223, description: "Moar french plz.", status: "accepted")
    project4 = user.projects.create!(service_id: service.id, zipcode: 80223, description: "CAN YOU MAKE ME FLUENT?! This is the job for you!.", status: "accepted")
    
    project.bids.create!(user_id: pro.id, amount: "200", comment: "I will really help you!", status: "rejected")
    project.bids.create!(user_id: pro.id, amount: "100", comment: "Hi, my name is Jimi. I've done several similar jobs in your area and have received some pretty excellent reviews. I'd love to talk more details about your 
    project. Please call me at 303-123-4345. Thanks!.", status: "accepted")
    
    project.create_review(comment: "These French lessons were adequate.", rating: 4.0, user_id: pro.id)

    project3.bids.create!(user_id: pro.id, amount: "20", comment: "I teach good French.", status: "accepted")
    project4.bids.create!(user_id: 1, amount: "35", comment: "I teach the best ever French.", status: "accepted")

    project2.bids.create!(user_id: 1, amount: "300", comment: "I am really spectacular at French.", status: "open")

  end

  def generate_project_with_no_review
    pro = Pro.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      zipcode: "80219",
                      phone_number: Faker::PhoneNumber.phone_number,
                      email: Faker::Internet.email,
                      password: "password",
                      country_code: "+1")
    service = Service.find_by(name: "French Lessons")
    pro_service = pro.pro_services.create(service_id: service.id, radius: 25)
    user = User.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      zipcode: "80219",
                      phone_number: Faker::PhoneNumber.phone_number,
                      email: "no_review@example.com",
                      password: "password",
                      country_code: "+1")

    project = user.projects.create!(service_id: service.id, zipcode: 80223, description: "I need french lessons.", status: "open", timeline: "ASAP")

    project1 = user.projects.create!(service_id: 2, zipcode: 80223, description: "I need french lessons.", status: "open", timeline: "Whenever")

    project2 = user.projects.create!(service_id: 55, zipcode: 80223, description: "I need french lessons.", status: "open", timeline: "Within 2 Weeks")

    bid = project.bids.create!(user_id: pro.id, amount: "100", comment: "I teach good French.", status: "accepted")
  end

  def generate_multiple_bids_for_project
    service = Service.find_by(name: "French Lessons")
    user = User.find_by_email('no_review@example.com')

    pro1 = Pro.create!(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zipcode: "80219",
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    password: "password",
    country_code: "+1")
    pro2 = Pro.create!(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zipcode: "80219",
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    password: "password",
    country_code: "+1")
    pro3 = Pro.create!(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zipcode: "80219",
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    password: "password",
    country_code: "+1")
    
    pro_service1 = pro1.pro_services.create(service_id: service.id, radius: 25)
    pro_service2 = pro2.pro_services.create(service_id: service.id, radius: 25)
    pro_service2 = pro3.pro_services.create(service_id: service.id, radius: 25)
    
    
    project = user.projects.create!(service_id: service.id, zipcode: 80223, description: "I need more french lessons.", status: "open", timeline: "ASAP")
    
    
    bid1 = project.bids.create!(user_id: pro1.id, amount: "100", comment: "I teach good French.", status: "open")
    bid2 = project.bids.create!(user_id: pro2.id, amount: "200", comment: "I teach better French.", status: "open")
    bid3 = project.bids.create!(user_id: pro3.id, amount: "300", comment: "I teach best French.", status: "open")
    
    
  end
end

Seed.new
