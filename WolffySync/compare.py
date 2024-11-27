import difflib

def compare_files(file1, file2):
    with open(file1, "r", encoding="utf-8") as f1:
        file1_content = f1.readlines()
    with open(file2, "r", encoding="utf-8") as f2:
        file2_content = f2.readlines()

    diff = difflib.unified_diff(file1_content, file2_content, fromfile=file1, tofile=file2, lineterm="")
    if not list(diff):
        print("Congratulations! Your outputs are exactly the same!")
        return 1
    else:
        print("Oh, pity. There are some differences between your outputs~")
        html_diff = difflib.HtmlDiff().make_file(
            file1_content, file2_content, 
            fromdesc=file1, todesc=file2
        )
        with open("diff.html", "w", encoding="utf-8") as f:
            f.write(html_diff)
        print("The diff report is created, go and check!")
        return 0