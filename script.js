// 1. Dark Mode Toggle with localStorage memory
const themeToggleBtn = document.getElementById('themeToggle');

if (themeToggleBtn) {
    if (localStorage.getItem('theme') === 'dark') {
        document.body.classList.add('dark-theme');
        themeToggleBtn.innerText = '☀️ Light Mode';
    }

    themeToggleBtn.addEventListener('click', () => {
        document.body.classList.toggle('dark-theme');
        const isDark = document.body.classList.contains('dark-theme');
        
        themeToggleBtn.innerText = isDark ? '☀️ Light Mode' : '🌙 Dark Mode';
        localStorage.setItem('theme', isDark ? 'dark' : 'light');
    });
}

// 2. Real-Time Search Filter (runs on pages with a search input)
const searchInput = document.getElementById('searchInput');
const searchableItems = document.querySelectorAll('.searchable-item');

if (searchInput) {
    searchInput.addEventListener('keyup', (e) => {
        const searchTerm = e.target.value.toLowerCase().trim();

        searchableItems.forEach(item => {
            const textContent = item.textContent.toLowerCase();
            if (textContent.includes(searchTerm)) {
                item.style.display = '';
            } else {
                item.style.display = 'none';
            }
        });
    });
}

// 3. Form Handler with Toast Feedback (runs on pages with the contact form)
const noteForm = document.getElementById('noteForm');

if (noteForm) {
    noteForm.addEventListener('submit', function(e) {
        e.preventDefault();

        const name = document.getElementById('name').value;
        const toast = document.getElementById('toast');

        toast.className = 'toast success';
        toast.innerText = `Thank you, ${name}! Your submission has been registered locally.`;
        toast.style.display = 'block';

        this.reset();

        setTimeout(() => {
            toast.style.display = 'none';
        }, 5000);
    });
}
