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
leo_post_on_animals = leo.posts.create(title: "You won't beleive this!", content: "This is the cutest kitten I've ever seen!" , community: animals)
ghostbird_post_on_forests = ghostbird.posts.create(title: "The Amazon Rainforests need Your Help!", content: "The wildfires in brazil threatens the existence of the largest rainforest in the world. Please, Read these articles to find out more: \"https://www.cnn.com/2019/08/23/americas/amazon-wildfires-411/index.html\", \"https://www.cnet.com/how-to/amazon-rainforest-fire-whats-happening-now-and-how-you-can-help-update-indigeous-tribes/\". There are plenty of ways we can help!!" , community: forests)
ghostbird_post_on_disasters = ghostbird.posts.create(title: "The Amazon Rainforests need Your Help!", content: "The wildfires in brazil threatens the existence of the largest rainforest in the world. Please, Read these articles to find out more: \"https://www.cnn.com/2019/08/23/americas/amazon-wildfires-411/index.html\", \"https://www.cnet.com/how-to/amazon-rainforest-fire-whats-happening-now-and-how-you-can-help-update-indigeous-tribes/\". There are plenty of ways we can help!!" , community: disasters)
control_post_on_anomalies = control.posts.create(title: "Something's Not Right...", content: "My co-worker has been acting very strange recently. Does it have anything to do with what's beyond that border? Maybe he was exposed to something? Even then, I've never felt so threatened... Like I've lost control... I'll come back later to keep you guys updated." , community: anomalies)
frank_post_on_sea = frank.posts.create(title: "We're doing more harm than good...", content: "Pollution is a huge problem! Approximately 71% of the earth's surface is covered by water. The accumulation of plastic debris in the ocean is heavily diminishing the quality of aquatic life. If you don't beleve me, do some research! This article -> \"https://www.pnas.org/content/114/38/9994\" <- is a great place to start!", community: sea)


# Comments
# Comments for LEO's post under ../ANIMALS
frank.comments.create(content: "Leo... PLEASE LET ME HAVE IT?!", post: leo_post_on_animals)

# Comments for FRANK's post under ../SEA
percy.comments.create(content: "Thank you, @frank! I've been trying to share this news for a while now.", post: frank_post_on_sea)
frank.comments.create(content: "I know!! That's how I got so invested in doing research.", post: frank_post_on_sea)
hazel.comments.create(content: "Hey! Do you two wanna organize an awareness walk?", post: frank_post_on_sea)
frank.comments.create(content: "You bet!!", post: frank_post_on_sea)
percy.comments.create(content: "That sounds Excellent, Hazel!", post: frank_post_on_sea)

# Comments for GHOSTBIRD's post under ../FORESTS
ghostbird.comments.create(content: "...You guys???", post: ghostbird_post_on_forests)
cynthia.comments.create(content: "I know, GB!! Try posting this in ../Disasters? I think that more people are in that community", post: ghostbird_post_on_forests)
ghostbird.comments.create(content: "That's a good idea cynthia, I'll try that right now!", post: ghostbird_post_on_forests)

# Comments for GHOSTBIRD's post under ../DISASTERS
frank.comments.create(content: "This is terrible!!", post: ghostbird_post_on_disasters)
nico.comments.create(content: "Does anyone know where we can find a list of resources to help out?", post: ghostbird_post_on_disasters)
piper.comments.create(content: "I'll brb, let me do some research", post: ghostbird_post_on_disasters)
piper.comments.create(content: "Okay, I found this post - \"https://www.cnbc.com/2019/08/27/amazon-wildfires-how-to-help.html\", Please everyone let's work together!", post: ghostbird_post_on_disasters)
cynthia.comments.create(content: "I'm with you, piper!", post: ghostbird_post_on_disasters)
nico.comments.create(content: "Yeah, we can all help out!", post: ghostbird_post_on_disasters)
frank.comments.create(content: "I'll start a fundraiser!", post: ghostbird_post_on_disasters)
jason.comments.create(content: "Do you need any help, frank?", post: ghostbird_post_on_disasters)
frank.comments.create(content: "Yeah, that'd be great!", post: ghostbird_post_on_disasters)
hazel.comments.create(content: "@percy", post: ghostbird_post_on_disasters)
percy.comments.create(content: "Woah thanks for tagging me, hazel!", post: ghostbird_post_on_disasters)
ghostbird.comments.create(content: "Thank you everyone! This really means a lot!", post: ghostbird_post_on_disasters)

# Comments for CONTROL's post under ../ANOMALIES
cynthia.comments.create(content: "Yep! It definitely has something to do with what's behind the border.", post: control_post_on_anomalies)
control.comments.create(content: "Wait, what? How are you so sure?", post: control_post_on_anomalies)
cynthia.comments.create(content: "It's kind of my fault...", post: control_post_on_anomalies)
control.comments.create(content: "Stop wasting my time! You don't even know who I'm talking about, or what the border is.", post: control_post_on_anomalies)
cynthia.comments.create(content: "You're talking about Whitby. And John, you should really do more research when you start a new job. If you had, you'd know that I preceded you.", post: control_post_on_anomalies)
control.comments.create(content: "Wait, you--", post: control_post_on_anomalies)
control.comments.create(content: "Tell me everything!", post: control_post_on_anomalies)
control.comments.create(content: "Cynthia??", post: control_post_on_anomalies)
annabeth.comments.create(content: "If she doesn't respond, reach out to me. Maybe we can help eachother...", post: control_post_on_anomalies)

# ------------------

# Favorite_communities


# Voted Posts


# voted Comments


# Moderators


# Moderated Communities