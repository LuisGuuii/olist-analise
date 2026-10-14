import sqlite3
import pandas as pd
from pathlib import Path

con = sqlite3.connect("olist.db")

for arquivo in Path("dados").glob("*.csv"):
    nome = arquivo.stem.replace("olist_", "").replace("_dataset", "")
    df = pd.read_csv(arquivo)
    df.to_sql(nome, con, if_exists="replace", index=False)
    print(f"{nome}: {len(df)} linhas")

con.close()