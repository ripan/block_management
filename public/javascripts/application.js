// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function popupChooseCategory(block_id) {
    var query_string = "/blocks/write_popup_upload_document?id=" + block_id + "&authenticity_token=" + window._token;
    Dialog.info({url:query_string}, {windowParameters: {width:500, height:200} });
    return false;
}

function disappear(){
    Dialog.cancelCallback();return false;
}
