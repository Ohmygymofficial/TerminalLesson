print("Bienvenue sur le programme de ... LA FERME !")


//======================
// MARK: - Parameters
//======================



//DECLARATIONS DES CONSTANTES ET VARIABLES
// le prix du voyage
let price = 1499.0

// L'argent total de JOE
var money = 0.0

// le nombre de jours pendant lesquels je dois economiser
var numberOfDay = 0

// Tableau avec Lait, Ble, Laine
var barn = ["milk" : 0,"wheat" : 0,"wool" : 0]

//declaration d'une variable pour rester en boucle dans le programme et ne pas sortir à la fin
var stayinprogram = "yes"




//======================
// MARK: - Activities
//======================





// FUNCTION TAILLE DE LA FERME
func calculateBarnSize() -> Int {
    var barnSize = 0
    for (_, fluxStock) in barn {
        barnSize += fluxStock
    }
    // ajout d'un return pour que la variable en sortie soit disponible en dehors de cette boucle
    return barnSize
}


// FUNCTION  feedCows Joe nourrit les vaches
func feedCows() {
    money -= 4
}


// FUNCTION   sell Joe vend ses produits
func sell() {
    money += Double(barn["milk"]!) * 0.50 // le lait
    money += Double(barn["wheat"]!) * 0.30 // le Ble
    money += Double(barn["wool"]!) * 1 // Les moutons
    // On a vendu, donc on remet la grange a zero
    barn = ["milk" : 0,"wheat" : 0,"wool" : 0]
}


// FUNCTION   harvest Joe moissone le blé et fais 100 pieces une fois par mois
func harvest() {
    barn["wheat"]! += 100
}


// FUNCTION   mowSheep Joe tond les moutons et fais 30 pieces 2 fois dans le mois
func mowSheep() {
    barn["wool"]! += 30
}


// FUNCTION   milkCows Joe traie les vaches
func milkCows() {
    barn["milk"]! += 30
}


//======================
// MARK: - Conversation
//======================



while stayinprogram == "yes" {
    


        print("Que voulez vous faire ?"
            + "\n1. 🤳 Enregistrer une nouvelle activité"
            + "\n2. 💰 Consulter ma banque"
            + "\n3. 🕋 Consulter ma grange"
            + "\n4. 🔚 Sortir du programme")

    




        if let choiceMenu1 = readLine() {
            switch choiceMenu1 {
            case "1":
                print("Qu'avez vous fait aujourd'hui ?"
                    + "\n1. 🤳 J'ai nourri mes animaux"
                    + "\n2. 💰 J'ai vendu mes produits"
                    + "\n3. 🍼 J'ai trait mes vaches"
                    + "\n4. 🌾 J'ai moissoné"
                    + "\n5. ⚪️ J'ai tondu les moutons")
                
                if let choiceMenu2 = readLine() {
                    switch choiceMenu2 {
                    case "1": //nourri les animaux
                        feedCows()
                    case "2": // vendu les produits
                        sell()
                    case "3": // traire les vaches
                        milkCows()
                    case "4": //moisson
                        harvest()
                    case "5": //moutons
                        mowSheep()
                    default:
                        print("Je n'ai pas compris")
                    }
                    print("Yes, bien bossé ! Bon courage pour le reste de la journée!")
                }
                
                
                
                
                
            case "2":
                print("Votre banque contient \(money) euros !")
                
            case "3":
                print("Votre grange contient :"
                    + "\n🍼  \(barn["milk"]!) bidons de lait"
                    + "\n🌾  \(barn["wheat"]!) bottes de blé"
                    + "\n⚪️  \(barn["wool"]!) pelottes de laine")
            case "4":
                stayinprogram = "no"
            default:
                print("Je n'ai pas compris")
            }
        }


    
}
