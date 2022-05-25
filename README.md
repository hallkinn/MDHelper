## Luca Comolli I2BC
---

- [MDHelper](#mdhelper)
  - [Descrizione](#descrizione)
  - [Uso](#uso)
  - [Comandi:](#comandi)
    - [**help**](#help)
    - [**table**](#table)
    - [**heading**](#heading)
    - [**norm**](#norm)
    - [**strike**](#strike)
    - [**italic**](#italic)
    - [**bold**](#bold)
    - [**bolditalic**](#bolditalic)
    - [**codeline**](#codeline)
    - [**codeblock**](#codeblock)
    - [**link**](#link)
    - [**quoted**](#quoted)
    - [**orderedlist**](#orderedlist)
    - [**unorderedlist**](#unorderedlist)
    - [**print**](#print)
    - [**end**](#end)

# MDHelper

## Descrizione
Questo è uno script in **powershell** che aiuta chi l'utente ad usare le funzioni base del formato **MD** (markdown), ad ogni modifica l'utente potrà vedere lo stato corrente delle modifiche da apportare.

---

## Uso
Per avviare lo script si potrà usare il suo file **.exe** oppure richiamando lo script da ***powershell*** o direttamente dalla shell di **VSCode**.
Questo script simula una specie di console limitata a comandi specifici per interagire con il file ***.MD***.

---

## Comandi:

|              Name               |         Usage         |               Type of command                |
| :-----------------------------: | :-------------------: | :------------------------------------------: |
|          [help](#help)          |     ```> help```      |                One-Parameter                 |
|         [table](#table)         |     ```> table```     | One-Parameter with options (tbcols + tbrows) |
|       [heading](#heading)       |    ```> heading```    |    One-Parameter with option ( dimension)    |
|          [norm](#norm)          |     ```> norm```      |                One-Parameter                 |
|        [strike](#strike)        |    ```> strike```     |                One-Parameter                 |
|        [italic](#italic)        |    ```> italic```     |                One-Parameter                 |
|          [bold](#bold)          |     ```> bold```      |                One-Parameter                 |
|    [bolditalic](#bolditalic)    |  ```> bolditalic```   |                One-Parameter                 |
|      [codeline](#codeline)      |   ```> codeline```    |                One-Parameter                 |
|     [codeblock](#codeblock)     |   ```> codeblock```   |                One-Parameter                 |
|          [link](#link)          |     ```> link```      |                One-Parameter                 |
|        [quoted](#quoted)        |    ```> quoted```     |                One-Parameter                 |
|   [orderedlist](#orderedlist)   |  ```> orderedlist```  |      One-Parameter  with option (rows)       |
| [unorderedlist](#unorderedlist) | ```> unorderedlist``` |      One-Parameter  with option (rows)       |
|         [print](#print)         |     ```> print```     |                One-Parameter                 |
|           [end](#end)           |      ```> end```      |         One-Parameter + confirmation         |

### **help**
  **Description:**
    Stampa tutti i comandie il loro uso a terminale.

  **Usage:**
  ```> help```

---

### **table**
  **Description:**
  Crea una tabella di _n_ righe e _n_ colonne

  **Usage:**
  ```powershell
  > table
  > 5 #cols
  > 5 #rows
  ```

---

### **heading**
  **Description:**
  Crea un heading di _n_ grandezza

  **Usage:**
  ```powershell
  > heading
  > 1 #dimension (max:6, smallest)
  ```

---

### **norm**
  **Description:**
  Non applica nessuna formattazione al testo

  **Usage:**
  ```> norm```

---

### **strike**
  **Description:**
  Formatta il testo ~~barrato~~

  **Usage:**
  ```> strike```

---

### **italic**
  **Description:**
  Formatta il testo in _italico_  

  **Usage:**
  ```> italic```

---

### **bold**
  **Description:**
  Formatta il testo in **grassetto**  

  **Usage:**
  ```> bold```

---

### **bolditalic**
  **Description:**
  Formatta il testo in ***italico grassetto***

  **Usage:**
  ```> bolditalic```
### **codeline**
  **Description:**
  Formatta il testo in ```linea di codice```

  **Usage:**
  ```> codeline```

---

### **codeblock**
  **Description:**
  Formatta il testo in 
  ```
  blocco di codice
  ```

  **Usage:**
  ```> codeblock```

---

### **link**
  **Description:**
  Formatta il testo in [link](link)$

  **Usage:**
  ```powershell
  > link
  > text #text
  > link #link
  ```

---

### **quoted**
  **Description:**
  Frormatta il testo con _n_ quote

  **Es:**
  > testo quotato
  >> testo quotato 2 volte

  **Usage:**
  ```powershell
  > quoted
  > 3 #number of quotes (max: 10)
  ```

---

### **orderedlist**
  **Description:**
  Crea una lista **PUNTATA** di _n_ righe

  **Es:**
  - item 1
  - item 2

  **Usage:**
  ```powershell
  > orderedlist
  > 3 #number of rows
  ```

---
### **unorderedlist**
  **Description:**
  Crea una lista **ORDINATA** di _n_ righe

  **Es:**
  1. item 1
  2. item 2

  **Usage:**
  ```powershell
  > unorderedlist
  > 3 #number of rows
  ```

---
### **print**
**Description:**
  Stampa lo stato corrente del testo creato

  **Usage:**
  ```> print```

---
### **end**
  **Description:**
  Chiede conferma di conclusione delle modifice e salvataggio del testo nel file **.MD**

  **Usage:**
  ```> end```

