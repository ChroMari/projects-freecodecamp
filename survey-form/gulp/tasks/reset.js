import { deleteAsync } from "del";
import { path } from "../config/path.js";

export const reset = () => {
  const clean = path.clean;

  return deleteAsync([clean]);
};
