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
var stayinprogram = true

var qte = "Ok"



//======================
// MARK: - Activities
//======================



// FUNCTION POUR LE LAIT : ELLE FONCTIONNE MAIS JE VAIS DEVOIR LA TAPER POUR TOUT : LE BLE, LE LAIT, LE LAINE ETC ETC
// DOnc trouver une solution pour que ce soit commun
// LE CODE CI DESSOUS FONCTIONNE MAIS UNIQUEMENT POUR LE LAIT
/*
 func pourLeLait()  {
 print("Combien de lait as tu extrait des rustines ? ")//Demander à Joe de saisir sa quantité pour les vaches
 if let qteLait = readLine() {  // Pour cela on est obligé d'utiliser readLine()
     if let qteLait2 = Int(qteLait) { //Verifier qu'il a bien saisie une quantité en entier
         print("Tu as pris : \(qteLait2) ")
         barn["milk"]! += qteLait2
     } else {
         print("Tu as saisi du texte")
     }
 }
 }
*/


func pourTous(de type : String) -> Int? {
    print("Saisir la quantité de \(type) extrait aujourd'hui : ")//Demander à Joe de saisir sa quantité pour les vaches
    if let qteTous = readLine() {  // Pour cela on est obligé d'utiliser readLine()
        if let qteTous2 = Int(qteTous) { //Verifier qu'il a bien saisie une quantité en entier
            print("Tu as pris : \(qteTous2) ")
            return qteTous2
        }
    }
    print("Tu as saisi du texte")
    return nil
}




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


//barn["wheat"]! += qteble

// FUNCTION   mowSheep Joe tond les moutons et fais 30 pieces 2 fois dans le mois
func mowSheep() {
    barn["wool"]! += 30
}


// FUNCTION   milkCows Joe traie les vaches
func milkCows(qty qteTous2: Int) {
    barn["milk"]! += qteTous2
}


//======================
// MARK: - Conversation
//======================




    func principalMenu() {
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
                        // DESOLE LILIAN, pour le moment, dans ma phase d'apprentissage, je continu à parler Francais et mettre certaines variable en Francais
                        // Car je ne maitrise pas encore et ca me perd si j'écris tout en anglais, car je me perd dans mes essais et ma re-lecture
                        // J'avoue avoir passé 4h à passer ce code, et que je ne comprend toujours pas pourquoi. La logique XCODE n'est pas encore la mienne.
                        // Car ayant (dans la fonction pourTous) une obligation de sortir un return de qteTous2 car je veux pouvoir utiliser le résultat ailleurs
                        // Donc je suis obligé de déclarer ma fonction avec un retour -> Int
                        // Donc je suis obligé d'écrire return qteTous2
                        // De ce que j'ai compris : En faisant ca, je peux utiliser qteTous2 OU même pourTous() dans le reste du code
                        // OR, c'est faux : je n'ai pas pu SIMPLEMENT écrire ici pourTous() puis milkcows()
                        // En gros je pensais que ca allait : Executer la fonction pourTous : Elle retourne qteTous2. Entrer dans la fonction milkCows et utiliser qteTous2 pour l'ajouter à la barn.
                        // Il a fallut donc que je fasse comme si qteTous2 était un optionnel et que je DEBALLE
                        // puis que j'affecte à la fonction milkCows la quantité ainsi récupérée...
                        // Perso, je trouve ca HYPER long car il faut écrire MOULTE fois if let blabla = ... puis de nouveau la variable qteTous2 dans la parenthese de la fonction
                        // puis enfin la récupérer la haut dans la fonction du milkCows.... je dois pas faire un truc correctement ???
                        // C'est un sujet sur lequel j'aimerais m'attarder, car la maitrise des types, fonctions, déclarations, variable etc est primordial je pense ;)
                        if let qteTous2 = pourTous(de: "Lait") {
                            milkCows(qty: qteTous2)
                        }
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
                stayinprogram = false
            default:
                print("Je n'ai pas compris")
            }
        }

    }

// Le programme en boucle

while stayinprogram == true {
    principalMenu()
    
}
