// ブラウザバックした時はリロードさせました（時間がなくてすいません）
window.addEventListener('popstate', function (e) {
    window.location.reload();
});
