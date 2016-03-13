$("form").submit(function() {
  $(this).find("input[type=hidden].contenteditable").each(function() {
    $input = $(this);
    $input.val($input.siblings("div.contenteditable:first").html());
  });
});
