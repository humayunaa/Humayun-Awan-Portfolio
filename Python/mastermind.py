import random

COLOURS = ["R", "G", "B", "Y", "W", "O"]

dict_colours = {
    "R" : "Red",
    "G" : "Green",
    "B" : "Blue",
    "Y" : "Yellow",
    "W" : "White",
    "O" : "Orange"
}

TRIES = 10
CODE_LENGTH = 4

def generate_code():
    code = []

    for _ in range(CODE_LENGTH):
        colour = random.choice(COLOURS)
        code.append(colour)

    return code

def guess_code():
    while True:
        guess = input("Guess: ")
        guess = guess.upper().split(" ")
        
        if len(guess) != CODE_LENGTH:
            print(f"You must guess {CODE_LENGTH} colours")

        for colour in COLOURS:
            if colour not in COLOURS:
                print(f"Invalid colour: {colour}. Try again")
                break
        else:
            break

    return guess

def check_code(guess, real_code):
    colour_counts = {}
    correct_pos = 0
    wrong_pos = 0

    for colour in real_code:
        if colour not in colour_counts:
            colour_counts[colour] = 0
        colour_counts[colour] += 1

    for guess_colour, real_colour in zip(guess, real_code):
        if guess_colour == real_colour:
            correct_pos += 1
            colour_counts[guess_colour] -= 1

    for guess_colour, real_colour in zip(guess, real_code):
        if guess_colour in colour_counts and colour_counts[guess_colour] > 0:
            wrong_pos += 1
            colour_counts[guess_colour] -= 1
    
    return correct_pos, wrong_pos

def game():
    print(f"Welcome to Mastermind. Try and guess the {CODE_LENGTH} colour code")
    print(f"Valid colours are:\n{COLOURS}")
    code = generate_code()
    for attempts in range(1, TRIES + 1):
        guess = guess_code()
        correct_pos, wrong_pos = check_code(guess, code)

        if correct_pos == CODE_LENGTH:
            print(f"You guessed the code in {attempts} attempts!")
            break
        
        print(f"Correct Positions: {correct_pos} | Incorrect Positions {wrong_pos}")

    else:
        print("You ran out of tries, the code was:", *code)


if __name__ == "__main__":
    game()