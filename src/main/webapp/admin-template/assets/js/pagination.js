function pagination(item, id) {
    $(document).ready(function () {
        var itemsPerPage = item;
        var itemsCount = $(id).length;
        var totalPages = Math.ceil(itemsCount / itemsPerPage);

        $('#pagination').pagination({
            items: itemsCount,
            itemsOnPage: itemsPerPage,
            cssStyle: 'light-theme',
            prevText: 'Trang trước',
            nextText: 'Trang tiếp',
            onPageClick: function (pageNumber) {
                var startIndex = (pageNumber - 1) * itemsPerPage;
                var endIndex = startIndex + itemsPerPage;
                $(id).hide().slice(startIndex, endIndex).show();
            }
        });

        $(id).hide().slice(0, itemsPerPage).show();
    });
}