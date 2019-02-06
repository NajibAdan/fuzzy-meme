#Creates dummy users
User.create!(
    name: 'Foo Bar',
    email: 'foo@bar.com',
    password: 'password',
    password_confirmation: 'password'
)
5.times do 
    User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: 'password', 
        password_confirmation: 'password'
    )
end

#Creates a dummy deck for User 1
user = User.first
3.times do 
    user.decks.create!(
        name: Faker::SwordArtOnline.item,
        description: Faker::TheITCrowd.quote
    )
end

# Fill the dummy decks with dummy values
tags = []
20.times do 
    tags.push(Faker::Company.buzzword)
end
user.decks.count do |deck|
    4.times do
        card = deck.cards.create!(
            day_to_study: (Date.today + rand(0..2)).strftime("%d/%m/%Y"),
            tag_list: tags.sample(4).join(',')
        )
           card.fronts.create!(
                text_field: Faker::LeagueOfLegends.quote
            )
            card.backs.create!(
                text_field: Faker::LeagueOfLegends.champion
            )
    end
end