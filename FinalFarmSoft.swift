print("Bienvenue sur le programme de ... LA FERME !")


//======================
// MARK: - Parameters
//======================



//DECLARATION let and Var

// Joe Money
var money = 0.0


// dictionary of different type of products
var barn = ["milk" : 0,"wheat" : 0,"wool" : 0]


// var declaration to stay or leave the program
var stayInProgram = true


//======================
// MARK: - Activities
//======================



// function for asking Quantity to the user
func fQuantity(de type : String) -> Int? {
    print("Saisir la quantité de \(type) extrait aujourd'hui : ")
    if let checkQty = readLine() {
        if let quantityInt = Int(checkQty) {
            print("Tu as pris : \(quantityInt) ")
            return quantityInt
        } else {
            print("Ce n'est pas un chiffre")
           return nil
        }
    }
    print("Erreur de saisie")
    return nil
}




// FUNCTION BarnSize
func calculateBarnSize() -> Int {
    var barnSize = 0
    for (_, fluxStock) in barn {
        barnSize += fluxStock
    }
    // add return to keep this VAR outside of this function
    return barnSize
}


// FUNCTION  to add daily cost of JOE
func feedCows() {
    money -= 4
}


// FUNCTION   JOE sell all the products that are in Barn
func sell() {
    // LILIAN : EXERCICE to replace ! by another method nil colascing or if let
    // I use colascing but it seem impossible that barn contain another thing than 0 or real number
    money += Double(barn["milk"] ?? 0 ) * 0.50
    money += Double(barn["wheat"] ?? 0 ) * 0.30
    money += Double(barn["wool"] ?? 0 ) * 1
    // Reset the Barn to Zero
    barn = ["milk" : 0,"wheat" : 0,"wool" : 0]
}




/* BEFORE OPTIMISATION

 FUNCTION   harvest  only for Wheat
func harvest(qty qteTous2: Int) {
    barn["wheat"]! += quantityInt
}


// FUNCTION   mowSheep only for Wool
func mowSheep(qty qteTous2: Int) {
    barn["wool"]! += qteTous2
    
}


// FUNCTION   milkCows only for Milk
func milkCows(qty qteTous2: Int) {
    barn["milk"]! += qteTous2
}
*/


// AFTER OPTIMISATION
// FUNCTION GENERIC
func genericAdd(qty quantityInt: Int, of activity: String) {
    barn[activity]! += quantityInt
}


//======================
// MARK: - Conversation
//======================



// principal Menu : Asking to JOE what he want to do : Add new activity ? Check bank ? Check Barn ? Leave the program
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
                case "1": // Feeds Cows
                    feedCows()
                case "2": // sell products
                    sell()
                case "3": // milk the cows
                    if let quantityInt = fQuantity(de: "Lait") {
                        let activity = "milk"
                        genericAdd(qty: quantityInt, of: activity)
                    }
                case "4": //  harvest
                    if let quantityInt = fQuantity(de: "Blé") {
                        let activity = "wheat"
                        genericAdd(qty: quantityInt, of: activity)
                    }
                case "5": // Shear  Sheep
                    if let quantityInt = fQuantity(de: "Moutons") {
                        let activity = "wool"
                        genericAdd(qty: quantityInt, of: activity)
                    }
                default:
                    print("Je n'ai pas compris")
                }
                // confirmation message
                    print("Yes, bien bossé ! Bon courage pour le reste de la journée!")
            }
            
            
            // bank account
        case "2":
            print("Votre banque contient \(money) euros !")
            
            
            // Barn stock
        case "3":
              // LILIAN : EXERCICE to replace ! by another method nil colascing or if let
            if barn["milk"] == nil {
                print("Probleme dans la grange, contactez votre administrateur immédiatement")
                barn["milk"] = 0
            }
            if barn["wheat"] == nil {
                print("Probleme dans la grange, contactez votre administrateur immédiatement")
                barn["wheat"] = 0
            }
            if barn["wool"] == nil {
                print("Probleme dans la grange, contactez votre administrateur immédiatement")
                barn["wool"] = 0
            }
            print("Votre grange contient :"
            
                + "\n🍼  \(barn["milk"] ?? 0) bidons de lait"
                + "\n🌾  \(barn["wheat"] ?? 0) bottes de blé"
                + "\n⚪️  \(barn["wool"] ?? 0) pelottes de laine")
            
        case "4":
            // to leave program
            stayInProgram = false
        default:
            print("Je n'ai pas compris")
        }
    }
    
}

// Loop program

while stayInProgram == true {
    principalMenu()
    
}

