<header >
  <h1 align="center">Visualização de lagostas</h1>
  <h2 align="center">(View lobsters)</h1>
</header>

<body>
  <main>
    <div> 
      <h3>O problema:</h3>
      <p>
        A partir de uma planilha requisitada pelo governo a empresa, buscamos soluções para automatiza-la e tentar deixar a pesquisa no layout para o usuário
        para que o mesmo realize poucas modificações antes de envia-la.
      </p>
    </div>
    <div>
      <h3>Brainstorm:</h3>
      <p>
        A partir do requerimento dos usuários realizamos uma consulta no banco de dados do ERP, afim de encontrar dados que pudessem satisfazer o modelo, como ela relacionava as entradas de pescado (especificamente lagosta), fomos até as tabelas que associadas poderiam nos trazer os dados necessários. 
      </p>
    </div>
    <div>
      <h3>Soluções:</h3>
      <p>
        Assim, apresentamos a solução a partir da <a href="https://github.com/Silas-ER/view_lobsters/blob/main/consulta_ajustada.sql">Consulta</a> onde primeiramente separamos a data e a hora que vem pro padrão do ERP em uma única variável, em seguida utilizei as especies de lagosta para fazer a soma do seu peso, independente se fossem pedaços ou o animal inteiro, e caso não fosse da especie especifica o valor retornaria o 0 e não adicionaria na soma, sempre definindo no final qual titulo aquele grupo de especies assumiria.
      </p>
      <p>
        Por fim, foram adicionados os campos de n° da nota fiscal correspondente aquele valor em peso, uma observação de qual seria o produto no final (inteira ou cauda), e o barco que a trouxe (controle interno).
      </p>
      <p>
        Nessa consulta foram utilizadas left joins afim de não ter duplicidade de dados com elementos de outras tabelas, e filtros para as entradas, diminuindo a quantidade de dados manipulados e eliminando especies indesejadas para a contagem.
      </p>
      <p>
        Por fim o relatorio quando integrado ao excel assumiu o seguinte resultado: 
      </p>
    </div> 
  </main>
</body>
