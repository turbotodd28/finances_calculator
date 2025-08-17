#!/usr/bin/env python3
# coding: utf-8

import tkinter as tk
from tkinter import ttk, filedialog
import pandas as pd

def main():

    def load_data():
        global dynamic_columns  # Explicitly declare as global
        file_path = filedialog.askopenfilename(
            initialdir='/home/me/Downloads',
            title="Select a CSV file", 
            filetypes=(("CSV files", "*.CSV"), ("All files", "*.*"))
        )

        if not file_path:
            return
        
        df = pd.read_csv(file_path)
        
        dynamic_columns = df.columns.tolist()
        print("Loaded columns:", dynamic_columns)  # Debugging output
        
        if "Amount" not in dynamic_columns:
            print("The 'Amount' column is not found in the loaded file.")
            return

        tree["columns"] = dynamic_columns
        
        for col in dynamic_columns:
            tree.heading(col, text=col)
            tree.column(col, anchor='w')
        
        for index, row in df.iterrows():
            tree.insert('', 'end', values=[row[col] for col in dynamic_columns])

    def update_total():
        global dynamic_columns  # Explicitly declare as global
        total = 0
        
        for child in tree.get_children():
            current_tags = list(tree.item(child, 'tags'))
            if 'highlighted' in current_tags:
                current_tags.remove('highlighted')
            tree.item(child, tags=current_tags)

        try:
            amount_col_index = dynamic_columns.index("Amount")
        except ValueError:
            print("The 'Amount' column is not found. Available columns are:", dynamic_columns)
            return

        for child in tree.get_children():
            if 'checked' in tree.item(child)['tags']:
                total += float(tree.item(child)['values'][amount_col_index])
                current_tags = list(tree.item(child, 'tags'))
                if 'highlighted' not in current_tags:
                    current_tags.append('highlighted')
                tree.item(child, tags=current_tags)
        total_label.config(text=f"Total: {total:.2f}")

    def check_row(event):
        row_id = tree.identify_row(event.y)
        if row_id:
            if 'checked' in tree.item(row_id)['tags']:
                tree.item(row_id, tags=['unchecked'])
            else:
                tree.item(row_id, tags=['checked'])
            
            update_total()
            tree.selection_remove(row_id)

    root = tk.Tk()
    root.title("Bank Statement")

    frame = tk.Frame(root)
    frame.pack(fill='both', expand=True)

    global dynamic_columns  # Declare at module level
    dynamic_columns = []

    tree = ttk.Treeview(frame, show='headings')
    tree.pack(side='left', fill='both', expand=True)

    tree.tag_configure('highlighted', background='yellow')

    scrollbar = ttk.Scrollbar(frame, orient='vertical', command=tree.yview)
    scrollbar.pack(side='right', fill='y')
    tree.configure(yscrollcommand=scrollbar.set)

    total_label = tk.Label(root, text="Total: 0.00")
    total_label.pack()

    tree.bind('<Double-1>', check_row)

    root.after(100, load_data)

    root.mainloop()

if __name__ == "__main__":
    main()
