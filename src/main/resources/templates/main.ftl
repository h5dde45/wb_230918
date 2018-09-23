<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main</title>
</head>
<body>
<div>
    <form action="/" method="post">
        <input type="text" name="text" placeholder="Enter message">
        <input type="text" name="tag" placeholder="Enter tag">
        <button type="submit">Add</button>
    </form>
</div>
<div>
    <form action="/filter" method="post">
        <input type="text" name="filter" placeholder="Enter tag-filter">
        <button type="submit">Search</button>
    </form>
</div>
<div>List messages</div>
<#list messages as message>
<div>
    <b>${message.id}</b>
    <span>${message.text}</span>
    <i>${message.tag}</i>
</div>
</#list>
</body>
</html>