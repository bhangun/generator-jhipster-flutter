
const path = require('path');

module.exports = {
    rewrite,
    rewriteFile,
    copyObjectProps
};

/**
 * Rewrite file with passed arguments
 * @param {object} args argument object (containing path, file, haystack, etc properties)
 * @param {object} generator reference to the generator
 */
function rewriteFile(args, generator) {
    args.path = args.path || process.cwd();
    const fullPath = path.join(args.path, args.file);

    args.haystack = generator.fs.read(fullPath);
    const body = rewrite(args);
    generator.fs.write(fullPath, body);
}

/**
 * Escape regular expressions.
 *
 * @param {string} str string
 * @returns {string} string with regular expressions escaped
 */
function escapeRegExp(str) {
    return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, '\\$&'); // eslint-disable-line
}

/**
 * Rewrite using the passed argument object.
 *
 * @param {object} args arguments object (containing splicable, haystack, needle properties) to be used
 * @returns {*} re-written file
 */
function rewrite(args) {
    console.log(`>>${args.haystack}`);
    // check if splicable is already in the body text
    /* const re = new RegExp(args.splicable.map(line => `\\s*${escapeRegExp(line)}`).join('\n'));

    if (re.test(args.haystack)) {
        return args.haystack;
    } */

    const lines = args.haystack.split('\n');

    let otherwiseLineIndex = -1;
    lines.forEach((line, i) => {
        console.log(`${lines[i]}`);
        if (line.includes(args.needle)) {
            console.log(`>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>i>> ${i}`);
            otherwiseLineIndex = i;
        }
    });

    let spaces = 0;
    while (lines[otherwiseLineIndex].charAt(spaces) === ' ') {
        console.log(`>><<<>> ${lines[otherwiseLineIndex]}`);
        spaces += 1;
        console.log(`spaces>>${spaces}<<`);
    }

    let spaceStr = '';
    console.log(`<<spaces>>${spaces}<<`);
    // eslint-disable-next-line no-cond-assign
    while ((spaces -= 1) >= 0) {
        spaceStr += ' ';
    }

    console.log(`${otherwiseLineIndex} <<spaceStr>>${spaceStr}<<`);

    lines.splice(otherwiseLineIndex, 0, args.splicable.map(line => spaceStr + line).join('\n'));

    return lines.join('\n');
}

/**
 * Copy object props from source to destination
 * @param {*} toObj
 * @param {*} fromObj
 */
function copyObjectProps(toObj, fromObj) {
    // we use Object.assign instead of spread as we want to mutilate the object.
    Object.assign(toObj, fromObj);
}
