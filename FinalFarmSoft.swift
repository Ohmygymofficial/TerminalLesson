print("Bienvenue sur le programme de ... LA FERME !")


//======================
// MARK: - Parameters
//======================



//DECLARATIONS let and Var

// Joe Money
var money = 0.0


// dictionary of different type of products
var barn = ["milk" : 0,"wheat" : 0,"wool" : 0]

// var declaraction to stay or leave the program
var stayinprogram = true


//======================
// MARK: - Activities
//======================



// function for asking Quantity to the user
func pourTous(de type : String) -> Int? {
    print("Saisir la quantité de \(type) extrait aujourd'hui : ")
    if let qteTous = readLine() {
        if let qteTous2 = Int(qteTous) {
            print("Tu as pris : \(qteTous2) ")
            return qteTous2
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
    money += Double(barn["milk"]!) * 0.50
    money += Double(barn["wheat"]!) * 0.30
    money += Double(barn["wool"]!) * 1
    // Reset the Barn to Zero
    barn = ["milk" : 0,"wheat" : 0,"wool" : 0]
}




// FUNCTION   harvest  only for Wheat
func harvest(qty qteTous2: Int) {
    barn["wheat"]! += qteTous2
}


// FUNCTION   mowSheep only for Wool
func mowSheep(qty qteTous2: Int) {
    barn["wool"]! += qteTous2
    
}


// FUNCTION   milkCows only for Milk
func milkCows(qty qteTous2: Int) {
    barn["milk"]! += qteTous2
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
                    if let qteTous2 = pourTous(de: "Lait") {
                        milkCows(qty: qteTous2)
                    }
                case "4": //  harvest
                    if let qteTous2 = pourTous(de: "Blé") {
                        harvest(qty: qteTous2)
                    }
                case "5": // Shear  Sheep
                    if let qteTous2 = pourTous(de: "Moutons") {
                        mowSheep(qty: qteTous2)
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
            print("Votre grange contient :"
                + "\n🍼  \(barn["milk"]!) bidons de lait"
                + "\n🌾  \(barn["wheat"]!) bottes de blé"
                + "\n⚪️  \(barn["wool"]!) pelottes de laine")
        case "4":
            // to leave program
            stayinprogram = false
        default:
            print("Je n'ai pas compris")
        }
    }
    
}

// Loop program

while stayinprogram == true {
    principalMenu()
    
}
