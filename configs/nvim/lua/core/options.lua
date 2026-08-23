vim.opt.mouse = ""                        -- bật toàn bộ hỗ trợ chuột

vim.opt.number = true                    -- Hiển thị số dòng tuyệt đối
vim.opt.relativenumber = true           -- Hiển thị số dòng tương đối (dòng hiện tại là tuyệt đối, các dòng khác là khoảng cách)
vim.opt.numberwidth = 3                 -- Độ rộng cột số dòng là 3 ký tự

vim.opt.clipboard = "unnamedplus"       -- Đồng bộ clipboard với hệ thống (dán và copy giữa Vim và hệ điều hành)

vim.opt.cursorline = true               -- Tô sáng dòng đang đứng con trỏ

-- vim.opt.wrap = false                    -- Không tự động xuống dòng nếu dòng quá dài
vim.opt.wrap = true
vim.opt.linebreak = true                   -- Ngắt dòng theo từ (không cắt giữa từ) — không hiệu lực nếu wrap = false

-- vim.opt.autoindent = true               -- Tự động thụt lề giống dòng trước khi nhấn Enter
-- vim.opt.smartindent = true              -- Thụt lề thông minh với các ngôn ngữ lập trình

-- vim.opt.ignorecase = true               -- Tìm kiếm không phân biệt hoa thường
-- vim.opt.smartcase = true                -- Nếu chuỗi tìm có chữ hoa → sẽ phân biệt hoa thường (ghi đè ignorecase)

vim.opt.shiftwidth = 2                  -- Số khoảng trắng khi thụt lề (Shift >> hoặc <<)
vim.opt.tabstop = 2                     -- 1 tab = 2 khoảng trắng (hiển thị)
vim.opt.softtabstop = 2                 -- Khi nhấn Tab sẽ thêm 2 khoảng trắng
vim.opt.expandtab = true                -- Dùng khoảng trắng thay vì ký tự tab thực

-- vim.opt.scrolloff = 30                  -- Luôn giữ 30 dòng trống phía trên/dưới con trỏ khi cuộn
-- vim.opt.sidescrolloff = 8              -- Luôn giữ 8 ký tự trống bên trái/phải con trỏ khi cuộn ngang

vim.opt.cmdheight = 1                  -- Chiều cao dòng lệnh (command line) là 1 dòng
vim.opt.termguicolors = true           -- Bật hỗ trợ màu 24-bit (true color) trong terminal
-- vim.opt.pumheight = 10                 -- Giới hạn độ cao của menu popup (menu gợi ý) là 10 dòng

-- vim.opt.showtabline = 2                -- Luôn hiển thị thanh tab (ngay cả khi chỉ có 1 tab)

-- vim.opt.signcolumn = "yes"             -- Luôn hiển thị cột dấu (sign column) — dùng cho lỗi, breakpoint, v.v.
vim.opt.splitbelow = true              -- Khi tách cửa sổ ngang, cửa sổ mới mở bên dưới
vim.opt.splitright = true              -- Khi tách cửa sổ dọc, cửa sổ mới mở bên phải
-- vim.opt.timeoutlen = 400               -- Thời gian chờ giữa các phím tổ hợp là 400ms

-- vim.opt.undofile = true                -- Bật lưu undo ra file (giữ lịch sử chỉnh sửa sau khi đóng file)
-- vim.opt.swapfile = false               -- Tắt tạo file swap (thường dùng để khôi phục khi bị crash)

-- vim.opt.whichwrap:append("bs<>[]hl")   -- Cho phép phím ← → hoặc Backspace, h, l đi sang dòng kế bên

vim.opt.fileencoding = "utf-8"         -- Đặt mã hóa mặc định khi lưu file là UTF-8
