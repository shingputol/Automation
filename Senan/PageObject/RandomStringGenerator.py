import random
import string

class RandomStringGenerator:
    def generate_random_string(self, length):
        letters_and_digits = string.digits
        return ''.join(random.choice(letters_and_digits) for _ in range(int(length)))
