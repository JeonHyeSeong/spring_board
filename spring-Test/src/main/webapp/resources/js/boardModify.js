document.addEventListener('click', (e) => {
     console.log(e.target);
     if (e.target.classList.contains('file-x')) {
          console.log('x버튼 클릭');
          let uuid = e.target.dataset.uuid;

          removeFile(uuid).then(result => {
               if (result == 1) {
                    alert('파일 삭제!');
                    e.target.closest('li').remove(); // li삭제
                    location.reload(); // 새로고침
               } else {
                    alert('파일 삭제 실패!');
               }
          })
     }
})

async function removeFile(uuid) {
     try {
          const url = '/board/file/' + uuid;
          const config = {
               method: 'delete'
          };
          const resp = await fetch(url, config);
          const result = await resp.text();
          return result;
     } catch (error) {
          console.log(error);
     }
}