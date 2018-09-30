<#import "parts/common.ftl" as c>

<@c.page>
<div class="alert alert-info mt-3" role="alert">
    <h4>${userChannel.username}</h4>
</div>
<ul class="list-group">
    <li class="list-group-item active">${type}</li>
    <#list users as user>
        <li class="list-group-item">
            <a href="/user-messages/${user.id}">${user.getUsername()}</a>
        </li>
    <#else >
        <li class="list-group-item">No ${type}</li>
    </#list>
</ul>
</@c.page>