// Menu: Open Project
// Description: Open a project from ~/dev folder or current project
// Shortcut: cmd shift .

import "@johnlindquist/kit";
import { existsSync } from "fs";

const HOME = await env("HOME");
const projectsFile = existsSync(`${HOME}/.projects.ts`)
  ? await attemptImport(`${HOME}/.projects.ts`)
  : undefined;

type Project = {
  name: string;
  value: string;
  description?: string;
};

const projectDirPath = `${HOME}/dev`;

const projects = ls(projectDirPath).map((dir): Project => {
  const fullPath = path.join(projectDirPath, dir);
  return {
    name: dir,
    value: fullPath,
    description: fullPath,
  };
});

const projectsFromFile = projectsFile?.default ?? [];
const allProjects: Project[] = [
  // The value seems to get mangled if we keep it as an array,
  // so we need to make it a comma-separated string and split after
  ...projectsFromFile.map((proj) => ({ ...proj, value: proj.value.join(",") })),
  ...projects,
];
const project = await arg("Select project:", allProjects);

project.split(",").forEach((dir) => {
  exec(`open -a Warp ${dir}`);
  exec(`code ${dir}`);
  exec(`smerge ${dir}`);
});
