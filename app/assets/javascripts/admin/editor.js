var testEditor;

$(function() {
    testEditor = editormd("test-editormd", {
        width   : "100%",
        height  : 640,
        syncScrolling : "single",
        path    : "/admin/assets/lib/"
    });

    /*
    // or
    testEditor = editormd({
        id      : "test-editormd",
        width   : "90%",
        height  : 640,
        path    : "../lib/"
    });
    */
});