# 🧪 Testing Your Web3 RPC Sender

A guide to manually testing your app and future automated testing.

---

## ✅ Manual Testing Checklist

### Basic Functionality

**Form Mode:**
- [ ] Select a method from dropdown
- [ ] Method description appears
- [ ] Parameters render correctly
- [ ] Required parameters are marked with *
- [ ] Can fill in all parameter types (string, number, object, boolean)
- [ ] Validation works for object parameters (invalid JSON shows error)
- [ ] Send button works
- [ ] Results appear for all endpoints
- [ ] Response time is shown
- [ ] Can copy response to clipboard

**Raw JSON Mode:**
- [ ] Toggle switches to Raw mode
- [ ] Can enter method name
- [ ] Can paste params without array brackets
- [ ] Real-time validation shows param count
- [ ] Invalid JSON shows error message
- [ ] Can send request in raw mode
- [ ] Results appear correctly

**Endpoints:**
- [ ] Can add multiple endpoints
- [ ] Can remove endpoints
- [ ] Cannot remove last endpoint
- [ ] Endpoint URLs are saved in inputs
- [ ] All endpoints receive requests simultaneously

**Results:**
- [ ] Success status shows green
- [ ] Error status shows red
- [ ] Response data is formatted JSON
- [ ] Long responses are scrollable
- [ ] Copy button works
- [ ] Multiple endpoint results appear side-by-side

---

## 🎯 Test Cases

### Test Case 1: Simple Method (eth_blockNumber)

**Steps:**
1. Add endpoint: `https://eth.llamarpc.com`
2. Select method: "Get Block Number"
3. Click "Send Requests"

**Expected:**
- ✅ Success status
- ✅ Response with block number (hex)
- ✅ Response time < 2000ms

---

### Test Case 2: Method with Parameters (eth_getBalance)

**Steps:**
1. Select method: "Get Balance"
2. Enter address: `0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045`
3. Leave block as "latest"
4. Send request

**Expected:**
- ✅ Success with balance in hex
- ✅ Or error if invalid address

---

### Test Case 3: Invalid JSON in Object Parameter

**Steps:**
1. Select method: "Call Contract"
2. Enter invalid JSON: `{invalid}`
3. Try to send

**Expected:**
- ✅ Error alert: "Invalid JSON for parameter transaction"

---

### Test Case 4: Raw Mode with Complex Params

**Steps:**
1. Toggle to Raw mode
2. Method: `eth_call`
3. Params:
```json
{
  "to": "0x6b175474e89094c44da98b954eedeac495271d0f",
  "data": "0x70a08231000000000000000000000000d8da6bf26964af9d7eed9e03e53415d37aa96045"
},
"latest"
```
4. Send

**Expected:**
- ✅ Validation shows "2 parameters"
- ✅ Request succeeds
- ✅ Response with result

---

### Test Case 5: Multiple Endpoints

**Steps:**
1. Add 3 endpoints:
   - `https://eth.llamarpc.com`
   - `https://rpc.ankr.com/eth`
   - `https://cloudflare-eth.com`
2. Send eth_blockNumber request

**Expected:**
- ✅ 3 result cards appear
- ✅ Each shows different response time
- ✅ Block numbers should be very close (within 1-2)

---

### Test Case 6: Error Handling

**Steps:**
1. Add invalid endpoint: `https://invalid-endpoint.com`
2. Send request

**Expected:**
- ✅ Red error status
- ✅ Error message in response
- ✅ App doesn't crash

---

## 🌐 Browser Compatibility Testing

Test in multiple browsers:

**Chrome/Edge:**
- [ ] All features work
- [ ] Favicon appears
- [ ] No console errors

**Firefox:**
- [ ] All features work
- [ ] Favicon appears
- [ ] No console errors

**Safari:**
- [ ] All features work
- [ ] Favicon appears
- [ ] No console errors

**Mobile (Chrome/Safari):**
- [ ] Layout is responsive
- [ ] Toggle switch works
- [ ] Can input data
- [ ] Results are readable

---

## 📱 Responsive Design Testing

**Desktop (1920x1080):**
- [ ] Content centered
- [ ] Max-width applied
- [ ] No horizontal scroll

**Laptop (1366x768):**
- [ ] All elements visible
- [ ] No overlap

**Tablet (768x1024):**
- [ ] Layout adjusts
- [ ] Forms are usable
- [ ] Results stack properly

**Mobile (375x667):**
- [ ] Everything fits
- [ ] Text is readable
- [ ] Buttons are tappable

---

## 🔒 Security Testing

**XSS Protection:**
- [ ] Try injecting `<script>alert('xss')</script>` in endpoint URL
- [ ] Try in method name
- [ ] Try in params
- [ ] None should execute

**Invalid Data:**
- [ ] Extremely long endpoint URL (10000 chars)
- [ ] Special characters in all fields
- [ ] Empty/null values
- [ ] App handles gracefully

---

## ⚡ Performance Testing

**Load Time:**
- [ ] Page loads in < 3 seconds
- [ ] methods.json loads successfully
- [ ] No render blocking

**Large Responses:**
- [ ] Can handle 1MB+ response
- [ ] JSON rendering doesn't freeze browser
- [ ] Copy still works

**Many Endpoints:**
- [ ] Add 10 endpoints
- [ ] All requests complete
- [ ] Results all appear
- [ ] No memory issues

---

## 🐛 Common Issues to Check

1. **CORS errors:**
   - Some public RPCs block browser requests
   - Try different endpoints if CORS error appears

2. **Rate limiting:**
   - Free endpoints may have rate limits
   - Multiple rapid requests might fail

3. **Invalid methods:**
   - Not all endpoints support all methods
   - Check endpoint documentation

4. **Timeout:**
   - Some requests take >30 seconds
   - Consider adding timeout handling

---

## 🤖 Future: Automated Testing

When you're ready to add automated tests, use:

### Testing Libraries:
- **Jest** - Test framework
- **Playwright** - Browser automation
- **Testing Library** - Component testing

### Example Test Structure:

```javascript
// test/app.test.js
describe('Web3 RPC Sender', () => {
  
  test('loads methods on startup', async () => {
    // arrange
    await page.goto('http://localhost:3000');
    
    // act
    const select = await page.$('#methodSelect');
    const options = await select.$$eval('option', opts => opts.length);
    
    // assert
    expect(options).toBeGreaterThan(1);
  });
  
  test('sends request successfully', async () => {
    // arrange
    await page.goto('http://localhost:3000');
    await page.fill('.rpc-input', 'https://eth.llamarpc.com');
    await page.selectOption('#methodSelect', '0'); // eth_blockNumber
    
    // act
    await page.click('.send-btn');
    
    // assert
    await page.waitForSelector('.result-card');
    const status = await page.$('.status-success');
    expect(status).toBeTruthy();
  });
  
});
```

---

## 📊 Test Coverage Goals

**Current:** Manual testing only

**Goal:**
- [ ] 80%+ code coverage
- [ ] All critical paths tested
- [ ] Edge cases covered
- [ ] CI/CD integration

---

## 🎯 Testing Workflow

**Before Every Commit:**
1. Run through basic functionality checklist
2. Test in at least 2 browsers
3. Check console for errors

**Before Every Release:**
1. Complete full manual test suite
2. Test on mobile
3. Test all test cases
4. Verify no regressions

**After Deploy:**
1. Test on production URL
2. Verify all endpoints work
3. Check performance

---

## 🚀 Quick Test Script

Save this and run it to quickly test common scenarios:

```javascript
// Paste in browser console on your app
(async function quickTest() {
  console.log('🧪 Starting quick test...');
  
  // Test 1: Methods loaded?
  const methods = document.querySelectorAll('#methodSelect option').length;
  console.log(methods > 1 ? '✅ Methods loaded' : '❌ Methods not loaded');
  
  // Test 2: Can add endpoint?
  const addBtn = document.querySelector('.btn-add');
  addBtn.click();
  const endpoints = document.querySelectorAll('.endpoint-row').length;
  console.log(endpoints > 1 ? '✅ Can add endpoint' : '❌ Cannot add endpoint');
  
  // Test 3: Toggle works?
  const toggle = document.querySelector('#modeToggle');
  toggle.click();
  const rawMode = document.querySelector('#rawMode.active');
  console.log(rawMode ? '✅ Toggle works' : '❌ Toggle broken');
  
  console.log('🎉 Quick test complete!');
})();
```

---

## 📝 Bug Report Template

When you find a bug:

```markdown
**Bug:** [Short description]

**Steps to Reproduce:**
1. 
2. 
3. 

**Expected:** 
**Actual:** 

**Browser:** Chrome 120
**OS:** macOS 14
**URL:** https://...

**Screenshot:** [if applicable]
**Console errors:** [if any]
```

---

## 💡 Testing Tips

1. **Test incrementally** - After each feature, test it
2. **Test edge cases** - Empty inputs, huge inputs, special chars
3. **Test error paths** - What happens when things fail?
4. **Test on real endpoints** - Not just localhost
5. **Test like a user** - Try to break it!

---

**Remember:** Good testing = fewer bugs = happier users = better developer! 🎯
