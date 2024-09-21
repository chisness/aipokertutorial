import os
import yaml
import shutil

def create_directory(path):
    if not os.path.exists(path):
        os.makedirs(path)

def move_file(src, dst):
    if os.path.exists(src):
        shutil.move(src, dst)

def update_yaml(yaml_file):
    with open(yaml_file, 'r') as file:
        data = yaml.safe_load(file)

    for item in data['book']['chapters']:
        if isinstance(item, dict) and 'part' in item:
            part_file = item['part']
            part_name = os.path.splitext(part_file)[0]
            create_directory(part_name)
            move_file(part_file, os.path.join(part_name, part_file))
            
            if 'chapters' in item:
                for chapter in item['chapters']:
                    move_file(chapter, os.path.join(part_name, chapter))
                
            item['part'] = f"{part_name}/{part_file}"
            if 'chapters' in item:
                item['chapters'] = [f"{part_name}/{chapter}" for chapter in item['chapters']]

    with open(yaml_file, 'w') as file:
        yaml.dump(data, file, default_flow_style=False)

def main():
    yaml_file = '_quarto.yml'  # Update this if your YAML file has a different name
    update_yaml(yaml_file)
    print("Files have been organized and YAML has been updated.")

if __name__ == "__main__":
    main()