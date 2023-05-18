SELECT 
	CONVERT(VARCHAR(10), BASE.data_hora, 103) AS DATA,
	CONVERT(VARCHAR(5), BASE.data_hora, 108) AS HORA,
	SUM(CASE WHEN REF.nome_lingua2 IN ('Panulirus argus','palinuridae-panulirus argus','Panulirus spp','palinuridae-panulirus spp') THEN MV.QTDE_UND ELSE 0 END) AS [LAGOSTA VERMELHA],
	SUM(CASE WHEN REF.nome_lingua2 IN ('Panulirus laevecauda','palinuridae-panulirus laevecauda') THEN MV.QTDE_UND ELSE 0 END) AS [LAGOSTA CABO VERDE],
	SUM(CASE WHEN REF.nome_lingua2 IN ('Panulirus echinatus') THEN MV.QTDE_UND ELSE 0 END) AS [LAGOSTA DE PEDRA],
	MV.NUM_DOCTO AS NF,
	SUBSTRING(MV.DESC_PRODUTO_EST, 1, 25) AS OBSERVACAO,
	OBS.OBSERVACAO AS BARCO
	
FROM 
	vwMovtoEntrada MV
	LEFT JOIN vwAtak4Net_EntradasBase AS BASE ON (BASE.Chave_fato = MV.CHAVE_FATO)
	LEFT JOIN tbProdutoRef AS REF ON (MV.COD_PRODUTO = REF.Cod_produto)
	LEFT JOIN tbEntradasObs AS OBS ON OBS.Chave_fato = MV.CHAVE_FATO

WHERE 
	MV.COD_DIVISAO1 = '004'
	AND MV.COD_TIPO_MV = 'T221'
	AND MV.DESC_PRODUTO_EST NOT LIKE '%SAPATA%'

GROUP BY 
	CONVERT(VARCHAR(10), BASE.data_hora, 103),
	CONVERT(VARCHAR(5), BASE.data_hora, 108),
	MV.DESC_PRODUTO_EST,
	MV.QTDE_UND,
	MV.NUM_DOCTO,
	OBS.OBSERVACAO
