**📌 README - Testes Automatizados do Coco Bambu**  

📖 **Descrição**  

Este projeto visa automatizar os testes do site de delivery do **Coco Bambu** utilizando o **Robot Framework**. Os testes abrangem:  

✅ Fluxo de navegação no site  
✅ Seleção de vouchers  
✅ Cadastro de usuário e autenticação  
✅ Escolha de forma de pagamento  
✅ Preenchimento de dados complementares  

---

📁 **Estrutura do Projeto**  

```
Projeto_CocoBambu/
│
├── keywords/             # Contém as palavras-chave reutilizáveis
│   └── keywords.robot
│
├── variables/            # Contém variáveis globais e mapeamento de elementos
│   └── mapa.robot
│
├── tests/                # Contém os casos de teste
│   └── TesteVoucher.robot
│
├── logs/                 # Armazena logs e reports gerados após a execução
│
└── README.md             # Documentação do projeto
```

🗂 **Detalhes dos Arquivos**  

- **`keywords.robot`** → Define funções reutilizáveis para os testes  
- **`mapa.robot`** → Contém variáveis e mapeamento dos elementos da página  
- **`TesteVoucher.robot`** → Casos de teste para o fluxo de vouchers  

---

⚙ **Configuração do Ambiente**  

**🔹 Pré-requisitos**  

- Python **3.x**  
- Robot Framework  
- SeleniumLibrary  
- FakerLibrary  
- WebDriver do navegador (ex: **ChromeDriver** para Google Chrome)  

**🔹 Instalação**  

1️⃣ **Clone o repositório:**  
```sh
git clone <URL_DO_REPOSITORIO>
cd Projeto_CocoBambu
```

2️⃣ **Instale as dependências:**  
```sh
pip install -r requirements.txt
```

3️⃣ **Baixe o ChromeDriver:**  
Baixe a versão compatível do [ChromeDriver aqui](https://sites.google.com/chromium.org/driver/downloads).  
Coloque-o em um diretório acessível e configure no `PATH`.  

---

🚀 **Execução dos Testes**  

Para rodar os testes, utilize:  
```sh
robot tests/TesteVoucher.robot
```
📌 **Dica:** Para gerar logs detalhados e report HTML:  
```sh
robot --outputdir logs tests/TesteVoucher.robot
```

🎯 **Exemplo de Caso de Teste (TesteVoucher.robot)**  
```robot
*** Test Cases ***
Compra de Voucher
    Dado que o site do Coco Bambu seja acessado
    Quando o usuário selecionar a aba de Vouchers
    E selecionar o Estado desejado
    Então o usuário deve visualizar as opções de vouchers disponíveis
```

---

🤝 **Contribuição**  

🔹 **Fork** o repositório  
🔹 Crie uma **branch** (`git checkout -b minha-feature`)  
🔹 Faça um **commit** (`git commit -m "Minha nova feature"`)  
🔹 Faça um **push** (`git push origin minha-feature`)  
🔹 Abra um **Pull Request** 🚀  
