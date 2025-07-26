import { test, expect } from '@playwright/test';

test('User can add a todo item', async ({ page }) => {
  await page.goto('http://localhost:3000');
  await page.fill('#new-todo', 'Write Playwright tests');
  await page.click('#add-button');
  await expect(page.locator('.todo-item')).toHaveText(/Write Playwright tests/);
});
