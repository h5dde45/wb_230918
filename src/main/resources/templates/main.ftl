<#import "parts/common.ftl" as c>
<#import "parts/pager.ftl" as p>
<#include "parts/security.ftl">

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form action="/filter" method="post" class="form-inline">
            <input type="text" name="filter" class="form-control"
                   placeholder="Enter tag-filter.." value="${filter!}">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>

<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample"
   role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new Message
</a>

<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form action="/main" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.text}</#if>"
                       name="text" placeholder="Enter message.."/>
                <#if textError??>
                    <div class="invalid-feedback">
                    ${textError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control ${(tagError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.tag}</#if>"
                       name="tag" placeholder="Enter tag..">
                <#if tagError??>
                    <div class="invalid-feedback">
                    ${tagError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Select the file in png format..</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
    </div>
</div>

    <@p.pager url page/>
<div class="card-columns">
    <#list page.content as message>
        <div class="card my-3">
            <#if message.image??>
                <img src="/img/${message.id}" class="card-img-top">
            </#if>
            <div class="m-2">
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                <a href="/user-messages/${message.author.id}">${message.authorName}</a>
                <#if message.author.id == currentUserId>
                    <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
                        Edit
                    </a>
                </#if>
            </div>
        </div>
    <#else>
        No message
    </#list>
</div>
    <@p.pager url page/>

</@c.page>