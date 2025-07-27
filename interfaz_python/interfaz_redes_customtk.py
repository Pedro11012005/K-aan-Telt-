
import customtkinter as ctk
from tkinter import filedialog
import tkinter.messagebox as messagebox

ctk.set_appearance_mode("light")
ctk.set_default_color_theme("blue")

class GeneApp(ctk.CTk):
    def __init__(self):
        super().__init__()

        self.title("Análisis de Redes Genéticas")
        self.geometry("1000x700")
        self.configure(bg="#d7ecf6")

        # === Panel: Carga de Datos ===
        self.datos_frame = ctk.CTkFrame(self, fg_color="#1e4d7b")
        self.datos_frame.pack(padx=20, pady=(20, 10), fill="x")

        ctk.CTkLabel(self.datos_frame, text="📥 Carga de Datos", text_color="white", font=("Arial", 16, "bold")).pack(anchor="w", padx=10, pady=(10, 0))

        btn_frame = ctk.CTkFrame(self.datos_frame, fg_color="transparent")
        btn_frame.pack(padx=10, pady=5, fill="x")

        self.genes_btn = ctk.CTkButton(btn_frame, text="Importar genes", command=self.import_genes)
        self.genes_btn.pack(side="left", padx=5, pady=5)

        self.caracts_btn = ctk.CTkButton(btn_frame, text="Importar características", command=self.import_characteristics)
        self.caracts_btn.pack(side="left", padx=5, pady=5)

        model_frame = ctk.CTkFrame(self.datos_frame, fg_color="transparent")
        model_frame.pack(padx=10, pady=5, fill="x")

        ctk.CTkLabel(model_frame, text="Modelo cargado:", text_color="white").pack(side="left")
        self.model_entry = ctk.CTkEntry(model_frame, placeholder_text="Importar modelo ML")
        self.model_entry.pack(side="left", fill="x", expand=True, padx=10)

        # === Panel: Análisis de Genes ===
        self.analisis_frame = ctk.CTkFrame(self, fg_color="#1e4d7b")
        self.analisis_frame.pack(padx=20, pady=10, fill="x")

        ctk.CTkLabel(self.analisis_frame, text="🧬 Análisis de Genes", text_color="white", font=("Arial", 16, "bold")).pack(anchor="w", padx=10, pady=(10, 0))

        # Switch
        switch_frame = ctk.CTkFrame(self.analisis_frame, fg_color="transparent")
        switch_frame.pack(padx=10, pady=(5, 0), anchor="w")

        ctk.CTkLabel(switch_frame, text=" ", width=10).pack(side="left")
        self.switch_var = ctk.StringVar(value="off")
        self.switch = ctk.CTkSwitch(switch_frame, text="OFF", variable=self.switch_var, onvalue="on", offvalue="off", command=self.toggle_switch)
        self.switch.pack(side="left")

        # Selección de genes
        select_frame = ctk.CTkFrame(self.analisis_frame, fg_color="transparent")
        select_frame.pack(padx=10, pady=5, anchor="w")

        ctk.CTkLabel(select_frame, text="Seleccionar genes:", text_color="white").pack(side="left")
        self.select_genes_entry = ctk.CTkEntry(select_frame, width=200)
        self.select_genes_entry.pack(side="left", padx=10)

        # Botones de análisis
        ctk.CTkButton(self.analisis_frame, text="Analizar uno", command=self.analyze_one).pack(pady=5, padx=20)
        ctk.CTkButton(self.analisis_frame, text="Analizar todos", command=self.analyze_all).pack(pady=5, padx=20)
        ctk.CTkButton(self.analisis_frame, text="Ver tabla completa", command=self.view_table).pack(pady=5, padx=20)

        # === Panel: Matriz ASTD ===
        self.astd_frame = ctk.CTkFrame(self, fg_color="#0d2e4d")
        self.astd_frame.pack(padx=20, pady=10, fill="both", expand=True)

        ctk.CTkLabel(self.astd_frame, text="🧩 Matriz ASTD", text_color="white", font=("Arial", 16, "bold")).pack(anchor="w", padx=10, pady=(10, 0))

        self.text_output = ctk.CTkTextbox(self.astd_frame, height=150)
        self.text_output.pack(padx=10, pady=10, fill="both", expand=True)

        # Botones inferiores
        bottom_frame = ctk.CTkFrame(self.astd_frame, fg_color="transparent")
        bottom_frame.pack(pady=10, padx=10, anchor="e")

        ctk.CTkButton(bottom_frame, text="Guardar análisis", command=self.save_analysis).pack(side="left", padx=5)
        ctk.CTkButton(bottom_frame, text="Cerrar", command=self.destroy).pack(side="left", padx=5)

    def import_genes(self):
        messagebox.showinfo("Importar", "Importar datos de genes")

    def import_characteristics(self):
        messagebox.showinfo("Importar", "Importar características")

    def toggle_switch(self):
        self.switch.configure(text="ON" if self.switch_var.get() == "on" else "OFF")

    def analyze_one(self):
        messagebox.showinfo("Análisis", "Analizar genes seleccionados")

    def analyze_all(self):
        messagebox.showinfo("Análisis", "Analizar todos los genes")

    def view_table(self):
        messagebox.showinfo("Tabla", "Ver tabla completa")

    def save_analysis(self):
        messagebox.showinfo("Guardar", "Guardar análisis")

if __name__ == "__main__":
    app = GeneApp()
    app.mainloop()
