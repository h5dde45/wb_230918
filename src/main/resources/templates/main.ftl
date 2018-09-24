<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div>
    <@l.logout/>
    <a class="badge badge-success" href="/user">User list</a>
</div>
<div>
    <form action="/main" method="post">
        <input type="text" name="text" placeholder="Enter message">
        <input type="text" name="tag" placeholder="Enter tag">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Add</button>
    </form>
</div>
<div>
    <form action="/filter" method="post">
        <input type="text" name="filter" placeholder="Enter tag-filter" value="${filter!}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Search</button>
    </form>
</div>
<div>List messages</div>
    <#list messages as message>
    <div>
        <b>${message.id}</b>
        <span>${message.text}</span>
        <i>${message.tag}</i>
        <strong>${message.authorName}</strong>
    </div>
    <#else >
    No message
    </#list>
</@c.page>