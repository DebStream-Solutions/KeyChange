import tkinter as tk
import subprocess

class LanguageSwitcher:
    def __init__(self, root):
        self.root = root
        self.root.title("Keyboard Language Switcher")

        # Create a list of available languages (you can customize this)
        self.languages = ["us", "cz", "fr", "de", "es"]  # Add more as needed

        # Create a variable to store the selected languages
        self.selected_languages = []

        # Create checkboxes for each language
        for lang in self.languages:
            var = tk.StringVar()
            checkbox = tk.Checkbutton(root, text=lang, variable=var, onvalue=lang, offvalue="")
            checkbox.pack()
            self.selected_languages.append(var)

        # Create a button to apply the selected languages
        apply_button = tk.Button(root, text="Apply", command=self.apply_languages)
        apply_button.pack()

    def apply_languages(self):
        # Get the selected languages
        selected_langs = [var.get() for var in self.selected_languages if var.get()]

        # Set the keyboard layout for each selected language
        for lang in selected_langs:
            subprocess.run(["setxkbmap", lang])

if __name__ == "__main__":
    root = tk.Tk()
    app = LanguageSwitcher(root)
    root.mainloop()
