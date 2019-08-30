# Users
saul = User.create(first_name: "Saul", last_name: "Evans", username: "saul", email: "saul@lighthousekeeper.com", password: "abc123")
cynthia = User.create(first_name: "Gloria", last_name: "unknown", username: "cynthia", email: "director@southernreach.com", password: "abc123")
ghostbird = User.create(first_name: "Ghost", last_name: "Bird", username: "ghostbird", email: "gb@biology.com", password: "abc123")
control = User.create(first_name: "John", last_name: "Rodriquez", username: "control", email: "control@southernreach.com", password: "abc123")

hazel = User.create(first_name: "Hazel", last_name: "Levesque", username: "hazel", email: "hazel@campjupiter.com", password: "abc123")
percy = User.create(first_name: "Percy", last_name: "Jackson", username: "percy", email: "percyj@camphalfblood.com", password: "abc123")
annabeth = User.create(first_name: "Annabeth", last_name: "Chase", username: "annabeth", email: "annabeth@camphalfblood.com", password: "abc123")
leo = User.create(first_name: "Leo", last_name: "Valdez", username: "leo", email: "leo@campjupiter.com", password: "abc123")
frank = User.create(first_name: "Frank", last_name: "Zhang", username: "frank", email: "frank@campjupiter.com", password: "abc123")
jason = User.create(first_name: "Jason", last_name: "Grace", username: "jason", email: "jason@campjupiter.com", password: "abc123")
piper = User.create(first_name: "Piper", last_name: "McLean", username: "piper", email: "piper@campjupiter.com", password: "abc123")
nico = User.create(first_name: "Nico", last_name: "DiAngelo", username: "nico", email: "nico@camphalfblood.com", password: "abc123")

# Communities
sea = percy.communities.create(name: "Oceans", description: "A community of aquatic enthusiasts")
anomalies = saul.communities.create(name: "Anomalies", description: "Strange occurances around the globe")
animals = frank.communities.create(name: "WildLife", description: "Animal Lovers")
forests = ghostbird.communities.create(name: "Forests", description: "Care about our forests? This is the place for you!")
disasters = control.communities.create(name: "Disasters", description: "Events, Preperation and Recovery")
diseases = piper.communities.create(name: "Diseases", description: "Doing research? Read a news article? Share anything you find here!")


# Posts




# Comments


# ------------------

# Favorite_communities


# Voted Posts


# voted Comments


# Moderators


# Moderated Communities