def remove_time(src_file):
    with open(src_file, "r", encoding="utf-8") as file:
        lines = file.readlines()

    processed_lines = ["@" + "@".join(line.split("@")[1:]) for line in lines if "@" in line]

    with open(src_file, "w", encoding="utf-8") as file:
        file.writelines(processed_lines)