$(function() {
  $.rails.allowAction = function(link) {
    if (!link.attr('data-confirm')) {
      return true;
    }
    $.rails.showConfirmDialog(link);
    return false;
  };
  $.rails.confirmed = function(link) {
    link.removeAttr('data-confirm');
    return link.trigger('click.rails');
  };
  return $.rails.showConfirmDialog = function(link) {
    var html, message;
    message = link.attr('data-confirm');
    html = "<div class=\"modal\" id=\"confirmationDialog\">\n  <div class=\"modal-dialog\">\n    <div class=\"modal-content\">\n      <div class=\"modal-header\">\n       <h3><i class=\"fa fa-trash\">\n        </i>  " + message + "</h3>\n      </div>\n      <div class=\"modal-footer\">\n        <a data-dismiss=\"modal\" class=\"btn btn-light\">" + "Cancel" + "</a>\n        <a data-dismiss=\"modal\" class=\"btn btn-danger confirm\">\n        " + "Delete" + "</a>\n      </div>\n    </div>\n  </div>\n</div>";
    $(html).modal('show');
    return $('#confirmationDialog .confirm').on('click', function() {
      return $.rails.confirmed(link);
    });
  };
});
