print("Bienvenue sur le programme de ... LA FERME !")


print("Que voulez vous faire ?")
    + "\n1. 🤳 Enregistrer une nouvelle activité"
    + "\n2. 💰 Consulter ma banque"
    + "\n3. 🕋 Consulter ma grange"




if let choice = readLine() {
    switch choice {
    case "1":
        print("Vous voulez enregistrer une nouvelle activité !")
    case "2":
        print("Votre banque contient X euros !")
    case "3":
        print("Votre grange contient :"
            + "\n🍼  X bidons de lait"
            + "\n🌾  X bottes de blé"
            + "\n⚪️  X pelottes de laine")
    default:
        print("Je ne comprends pas.")
    }
}

