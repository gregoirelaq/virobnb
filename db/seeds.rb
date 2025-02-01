# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
puts "Cleaning database"
Virus.destroy_all
puts "Database has been cleaned"
puts "Creating seeds"
User.create(email: "nusay@gmail.com", password: "123456")
syndrome_du_controle_z = Virus.create!(
  name: "Syndrome du 'CTRL+Z'",
  description: "Ce virus provoque une incapacité chronique à assumer ses décisions. Chaque action déclenche immédiatement un doute profond, suivi d'un désir incontrôlable d'annuler et de recommencer. Commander un plat au restaurant ? Mauvaise idée, vous vouliez l'autre. Envoyer un message ? Trop tard, vous regrettez déjà la tournure de votre phrase. La victime est constamment en train d'hésiter et de revenir sur ses choix, ce qui la plonge dans une spirale de frustration et d'indécision perpétuelle.",
  price: 10,
  user_id: 1,
  contagion_rate: 2,
  symptom_severity: 3,
  vaccine_availability: "no",
)
file = URI.parse("https://cdn.pixabay.com/photo/2018/02/26/17/25/teddy-3183563_960_720.jpg").open
syndrome_du_controle_z.photo.attach(io: file, filename: "syndrome-controle-z.jpg", content_type: "image/jpg")
syndrome_du_controle_z.save!

grippe_bout_langue = Virus.create!(
  name: "Grippe du 'Mot sur le Bout de la Langue'",
  description: "Un virus extrêmement agaçant qui affecte la mémoire lexicale des personnes contaminées. Les victimes sont incapables de se souvenir du mot exact qu'elles veulent utiliser, bien qu'elles en aient une idée très précise. Ce phénomène s'accompagne souvent de gestes frénétiques et d'expressions faciales de frustration intense, car plus elles essaient de retrouver le mot, plus il semble disparaître dans les méandres de leur cerveau. Ce virus est particulièrement dévastateur lors des discussions en public ou des présentations professionnelles.",
  price: 15,
  user_id: 1,
  contagion_rate: 3,
  symptom_severity: 2,
  vaccine_availability: "no",
)
file = URI.parse("https://www.shutterstock.com/shutterstock/photos/2186759799/display_1500/stock-photo-photo-of-young-pretty-woman-scratching-head-oops-forgot-credit-card-cafe-looking-empty-space-2186759799.jpg").open
grippe_bout_langue.photo.attach(io: file, filename: "grippe-bout-langue.jpg", content_type: "image/jpg")
grippe_bout_langue.save!

gif_involontaire = Virus.create!(
  name: "Virus du 'GIF Involontaire'",
  description: "Une étrange mutation comportementale qui transforme ses victimes en véritables GIFs humains. Les symptômes incluent des répétitions incontrôlables de mouvements et d'expressions faciales, comme des haussements de sourcils excessifs, des hochements de tête automatiques ou des clins d'œil intempestifs. Ces tics deviennent si prévisibles que les proches de la victime commencent à anticiper et à se moquer de leurs réactions, rendant l'affliction encore plus embarrassante.",
  price: 20,
  user_id: 1,
  contagion_rate: 4,
  symptom_severity: 2,
  vaccine_availability: "no",
)
file = URI.parse("https://www.shutterstock.com/shutterstock/photos/2502276175/display_1500/stock-photo-interested-guy-asks-what-not-hear-whisper-quiet-sound-hearing-loss-and-deaf-problems-with-2502276175.jpg").open
gif_involontaire.photo.attach(io: file, filename: "gif-involontaire.jpg", content_type: "image/jpg")
gif_involontaire.save!

quoi_deja = Virus.create!(
  name: "Syndrome du 'Quoi déjà ?'",
  description: "Ce virus provoque des pertes de mémoire soudaines et récurrentes. Vous entrez dans une pièce avec une intention claire, mais dès que vous y êtes, impossible de vous rappeler pourquoi vous êtes là. Vous ouvrez un onglet sur votre navigateur, mais vous avez oublié ce que vous cherchiez. Vous commencez une phrase, mais la chute vous échappe. Ce phénomène crée une sensation constante de confusion et peut être particulièrement handicapant lorsqu'on tente de mener une conversation ou d'accomplir une tâche importante.",
  price: 12,
  user_id: 1,
  contagion_rate: 2,
  symptom_severity: 4,
  vaccine_availability: "no",
)
file = URI.parse("https://www.shutterstock.com/shutterstock/photos/2502276161/display_1500/stock-photo-worried-thinking-around-hipster-american-man-on-blue-confused-student-guy-finding-answer-or-trying-2502276161.jpg").open
quoi_deja.photo.attach(io: file, filename: "quoi-deja.jpg", content_type: "image/jpg")
quoi_deja.save!

genie_3h_mat = Virus.create!(
  name: "Fièvre du 'J'ai Une Idée de Génie à 3h du Mat'",
  description: "Un virus qui affecte principalement les esprits créatifs et les entrepreneurs en manque de sommeil. Il provoque des poussées soudaines d’inspiration en pleine nuit, forçant la victime à se réveiller avec la certitude d’avoir eu une idée révolutionnaire. Cependant, si elle ne la note pas immédiatement, cette idée disparaît au réveil, laissant place à une profonde frustration. Pire encore, lorsqu'elle la relit le lendemain matin, elle réalise que son soi nocturne surestimait grandement la pertinence de son idée, qui se révèle souvent complètement absurde.",
  price: 18,
  user_id: 1,
  contagion_rate: 3,
  symptom_severity: 2,
  vaccine_availability: "no",
)
file = URI.parse("https://www.shutterstock.com/shutterstock/photos/2206643147/display_1500/stock-photo-pensive-funny-awesome-tanned-curly-man-in-basic-t-shirt-can-not-make-decision-posing-isolated-on-2206643147.jpg").open
genie_3h_mat.photo.attach(io: file, filename: "genie-3h-mat.jpg", content_type: "image/jpg")
genie_3h_mat.save!

puts "All seeds has been created"
