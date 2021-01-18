/**
 * 指定范围内查找所有 selector 元素
 * @param {string} selector CSS 选择器
 * @param {HTMLElement | Document} target 查找范围, 默认 document
 */
export const getAll = (selector, target = document) => {
  return Array.from(target.querySelectorAll(selector));
  // return [].slice.call(document.querySelectorAll(selector));
};

/**
 * 指定范围内查找第一个 selector 元素
 * @param {string} selector CSS 选择器
 * @param {HTMLElement | Document} target 查找范围, 默认 document
 */
export const getFirst = (selector, target = document) => {
  return target.querySelector(selector);
};
