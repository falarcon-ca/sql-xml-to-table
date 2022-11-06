DECLARE @xmlExample XML = '
<Root>
	<Element attrId="1" attrDescription="Text 1" attrNumber="01234"></Element>
	<Element attrId="2" attrDescription="Text 2" attrNumber="56789"></Element>
</Root>
'

SELECT
	Result.item.value('@attrId', 'INT') AS [Id],
	Result.item.value('@attrDescription', 'VARCHAR(500)') AS [Description],
	Result.item.value('@attrNumber', 'INT') AS [Number]
FROM
	@xmlExample.nodes('/Root/Element') Result(item)
